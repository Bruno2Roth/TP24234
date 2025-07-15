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
                return RedirectToAction("Miembros",  new { Grupo = integrante.idGrupo });
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



    }
}