/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FindTheSmile;

/**
 *
 * @author bdubus
 */
public class Error {
    private final String unauthorized = "Erreur 401 : Une authentification est nécessaire pour accéder à cette page.";
    private final String methodNotAllowed = "Erreur 405 : Méthode de requête non autorisée.";

    public String getUnauthorized()
    {
        return unauthorized;
    }
    public String getWrongMethod()
    {
        return methodNotAllowed;
    }
}
