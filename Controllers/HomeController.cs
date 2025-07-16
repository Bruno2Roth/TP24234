using Microsoft.AspNetCore.Mvc;
using TP24234.Models;

namespace TP24234.Controllers
{
    public class HomeController : Controller
    {


        public IActionResult Index()
        {
            ViewBag.Error = false;
            return View("Index");
        }

        [HttpPost]
        public IActionResult Login(string usuario, string contraseña)
        {

            if (BD.VerificarContraseña(usuario, contraseña))
            {
                Integrante integrante = BD.ObtenerPorUsuario(usuario);
                return RedirectToAction("Miembros", new { Grupo = integrante.idGrupo });
            }

            ViewBag.Error = true;
            return View("Index");
        }
        public IActionResult Miembros(int Grupo)
        {
            Grupo g = BD.ObtenerGrupo(Grupo);
            g.miembros = BD.TodosLosDeUnGrupo(Grupo);
            ViewBag.Miembros = g;

            return View("Miembros");
        }

        public IActionResult AgregarMiembros(int Grupo)
        {
            return View();
        }

        public IActionResult ponerMiembroEnBD(string nombre, string usuario, string contraseña, string frase, string hobby, string profeFav, string peliculaFav, string foto, int IDgrupo)
        {
            BD.AgregarIntegrante(nombre, usuario, contraseña, frase, hobby, profeFav, peliculaFav, foto, IDgrupo);
            Integrante i = BD.ObtenerPorUsuario(usuario);
            Grupo g = BD.ObtenerGrupo(IDgrupo);
            g.miembros.Add(i);


            return View("Login");
        }

    }
}


