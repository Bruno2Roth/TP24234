using Microsoft.AspNetCore.Mvc;
using TP24234.Models;

namespace TP24234.Controllers
{
    public class HomeController : Controller
    {

        [HttpPost]
        public IActionResult Login(string usuario, string contraseña)
        {
            BD bd = new BD();

            if (bd.VerificarContraseña(usuario, contraseña))
            {
                HttpContext.Session.SetString("usuario", usuario);
                Integrante integrante = bd.ObtenerPorUsuario(usuario);
                return RedirectToAction("Miembros", integrante.idGrupo);
            }

            ViewBag.Error = true;
            return View("Login");
        }
        public IActionResult Miembros(int Grupo)
        {
            BD bd = new BD();
            List<Integrante> lista = bd.TodosLosDeUnGrupo(Grupo); 
            return View("MiembrosGrupo");
        }


        /*[HttpPost]
        public IActionResult Registrar()
        {
            
        }*/
    }
}