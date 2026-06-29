/**
 * Cloudflare Worker - Dynamic Gallery API
 * Bind your R2 bucket as GALLERY.
 */

const ALBUM_IDS = {
  "good-times":"good-times",
  "photos":"photos",
  "Photos-Mini-Spy-Cam":"mini-spy-cam",
  "Presentation":"presentation",
  "Videos":"videos",
  "Grand-Finale":"grand-finale",
  "Videos-Mini-Spy-Cam":"videos-mini-spy",
  "good-times-2":"good-times-2"
};

const IMAGE_EXT = new Set([
"jpg","jpeg","png","gif","webp","avif","heic","heif","bmp","tif","tiff","svg"
]);

const VIDEO_EXT = new Set([
"mp4","mov","avi","webm","mkv","m4v","mpeg","mpg","3gp"
]);

export default {
  async fetch(request, env) {

    if (new URL(request.url).pathname !== "/")
      return new Response("Not Found",{status:404});

    const top = await env.GALLERY.list({
      prefix:"gallery/",
      delimiter:"/"
    });

    const output = {};

    for (const p of top.delimitedPrefixes ?? []) {

      const folder = p.replace(/^gallery\//,"").replace(/\/$/,"");
      const albumId = ALBUM_IDS[folder] ??
        folder.toLowerCase().replace(/\s+/g,"-");

      const listed = await env.GALLERY.list({prefix:p});

      const files=[];

      for(const obj of listed.objects){

        if(obj.key.endsWith("/")) continue;

        const name=obj.key.split("/").pop();

        if(!name || name.startsWith(".")) continue;
        if(name==="Thumbs.db") continue;

        const ext=name.split(".").pop().toLowerCase();

        let t=null;

        if(IMAGE_EXT.has(ext)) t="image";
        else if(VIDEO_EXT.has(ext)) t="video";
        else continue;

        files.push({
          f:name,
          t:t
        });
      }

      files.sort((a,b)=>
        a.f.localeCompare(
          b.f,
          undefined,
          {numeric:true,sensitivity:"base"}
        )
      );

      output[albumId]={
        folder,
        files
      };
    }

    return new Response(JSON.stringify(output,null,2),{
      headers:{
        "Content-Type":"application/json",
        "Access-Control-Allow-Origin":"*",
        "Cache-Control":"public,max-age=300"
      }
    });
  }
}
