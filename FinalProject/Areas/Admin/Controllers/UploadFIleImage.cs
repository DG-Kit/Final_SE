using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Threading.Tasks;

namespace FinalProject.Areas.Admin.Controllers
{
    public static class UploadFIleImage
    {
        public static async Task<Uri> UploadFile(IFormFile file)
        {
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), file.FileName);
            using(var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }
            Account account= new Account("ddylildbb", "934628653289474", "vNxSvC1P6OPXoG0hLu48CU_lafY");
            Cloudinary cloudinary = new Cloudinary(account);
            var uploadParams = new ImageUploadParams()
            {
                File = new FileDescription(filePath),
            };
            ImageUploadResult res = cloudinary.Upload(uploadParams);
            System.IO.File.Delete(filePath);
            return res.Url;
        }
    }
}