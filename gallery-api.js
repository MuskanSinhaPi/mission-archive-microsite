export default {
  async fetch(request, env) {
    const albumMap = {
      "good-times":"good-times",
      "photos":"photos",
      "Photos-Mini-Spy-Cam":"mini-spy-cam",
      "Presentation":"presentation",
      "Videos":"videos",
      "Grand-Finale":"grand-finale",
      "Videos-Mini-Spy-Cam":"videos-mini-spy",
      "good-times-2":"good-times-2"
    };

    const imageExt=new Set(["jpg","jpeg","png","gif","webp","avif","heic","heif","bmp","tiff","svg"]);
    const videoExt=new Set(["mp4","mov","avi","webm","mkv","m4v","mpeg","mpg","3gp"]);

    const folders=(await env.GALLERY.list({prefix:"gallery/",delimiter:"/"})).delimitedPrefixes||[];
    const out={};

    for(const prefix of folders){
      const folder=prefix.replace(/^gallery\//,"").replace(/\/$/,"");
      const id=albumMap[folder]||folder.toLowerCase().replace(/\s+/g,"-");
      const files=(await env.GALLERY.list({prefix})).objects
        .filter(o=>!o.key.endsWith("/"))
        .map(o=>{
          const f=o.key.split("/").pop();
          if(f.startsWith(".")) return null;
          const ext=f.split(".").pop().toLowerCase();
          let t=null;
          if(imageExt.has(ext)) t="image";
          else if(videoExt.has(ext)) t="video";
          if(!t) return null;
          return {f,t};
        })
        .filter(Boolean)
        .sort((a,b)=>a.f.localeCompare(b.f,undefined,{numeric:true,sensitivity:"base"}));
      out[id]={folder,files};
    }

    return new Response(JSON.stringify(out),{
      headers:{
        "content-type":"application/json",
        "cache-control":"public, max-age=300"
      }
    });
  }
}
