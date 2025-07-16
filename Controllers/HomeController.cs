using Microsoft.AspNetCore.Mvc;
using TP24234.Models;

namespace TP24234.Controllers
{
    public class HomeController : Controller
    {


        public IActionResult Index()
        {
            ViewBag.Error = false;

            if (Objeto.StringToObject<bool>(HttpContext.Session.GetString("logeado")))
            {

                return RedirectToAction("Miembros", new { Grupo = HttpContext.Session.GetString("logeado") });

            }

            return View("Index");
        }

        [HttpPost]
        public IActionResult Login(string usuario, string contraseña)
        {
            bool logeado = false;

            if (BD.VerificarContraseña(usuario, contraseña))
            {
                Integrante integrante = BD.ObtenerPorUsuario(usuario);

                int grupoSesión = integrante.idGrupo;
                logeado = true;

                HttpContext.Session.SetString("grupoSesión", Objeto.ObjectToString(grupoSesión));
                HttpContext.Session.SetString("logeado", Objeto.ObjectToString(logeado));


                return RedirectToAction("Miembros", new { Grupo = integrante.idGrupo });
            }


            ViewBag.Error = true;
            return View("Index");
        }
        public IActionResult Miembros()
        {
            if (!Objeto.StringToObject<bool>(HttpContext.Session.GetString("logeado")))
            { 
                return RedirectToAction("Index");
            }
            int nGrupo = Objeto.StringToObject<int>(HttpContext.Session.GetString("grupoSesión"));

            Grupo g = BD.ObtenerGrupo(nGrupo);
            g.miembros = BD.TodosLosDeUnGrupo(nGrupo);
            ViewBag.Miembros = g;

            return View("Miembros");
        }

        public IActionResult AgregarMiembros(int Grupo)
        {
            if (!Objeto.StringToObject<bool>(HttpContext.Session.GetString("logeado")))
            { 
                return RedirectToAction("Index");
            }


            return View();
        }

        public IActionResult ponerMiembroEnBD(string nombre, string usuario, string contraseña, string frase, string hobby, string profeFav, string peliculaFav, string foto, int IDgrupo)
        {
            BD.AgregarIntegrante(nombre, usuario, contraseña, frase, hobby, profeFav, peliculaFav, foto, IDgrupo);
            Grupo g = BD.ObtenerGrupo(IDgrupo);
            g.miembros = BD.TodosLosDeUnGrupo(IDgrupo);
            Integrante i = BD.ObtenerPorUsuario(usuario);


            g.miembros.Add(i);


            return View("Index");
        }
        public IActionResult CerrarSesión()
        {
            HttpContext.Session.SetString("logeado", Objeto.ObjectToString(false));

            return View("Index");
        }
    }
}


