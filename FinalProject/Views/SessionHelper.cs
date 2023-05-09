using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Views
{
    public static class SessionHelper
    {
        public static void SetObjectAsJson(HttpSessionStateBase session, string key, object value)
        {
            session[key] = JsonConvert.SerializeObject(value);
        }

        public static T GetObjectFromJson<T>(HttpSessionStateBase session, string key)
        {
            var value = session[key] as string;
            return value == null ? default(T) : JsonConvert.DeserializeObject<T>(value);
        }
    }
}