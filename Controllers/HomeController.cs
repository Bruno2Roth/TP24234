using Microsoft.AspNetCore.Mvc;
using TP24234.Models;

namespace TP24234.Controllers
{
    public class HomeController : Controller
    {


        public IActionResult Index(int Grupo)
        {
            ViewBag.Error = false;
            return View("Index");
        }

        [HttpPost]
        public IActionResult Login(string usuario, string contraseña)
        {
            BD bd = new BD();

            if (bd.VerificarContraseña(usuario, contraseña))
            {
                HttpContext.Session.SetString("partida", Objeto.ObjectToString(bd));
                Integrante integrante = bd.ObtenerPorUsuario(usuario);
                return RedirectToAction("Miembros", integrante.idGrupo);
            }

            ViewBag.Error = true;
            return View("Index");
        }
        public IActionResult Miembros(int Grupo)
        {
            BD bd = new BD();
            List<Integrante> lista = bd.TodosLosDeUnGrupo(Grupo);
            ViewBag.Miembros = lista;
            return View("MiembrosGrupo");
        }



    }
}