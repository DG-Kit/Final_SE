using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProject.Areas.Admin.Models
{
    public class LoginViewModelAdmin
    {
        [Required(ErrorMessage = "Vui lòng nhập email.")]
        [DataType(DataType.EmailAddress, ErrorMessage = "Email không hợp lệ.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu.")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
