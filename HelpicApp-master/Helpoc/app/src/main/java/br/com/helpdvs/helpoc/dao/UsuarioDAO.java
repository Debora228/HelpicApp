package br.com.helpdvs.helpoc.dao;

import java.util.ArrayList;
import java.util.List;

import br.com.helpdvs.helpoc.model.Usuario;

public class UsuarioDAO {
    private final static List<Usuario> usuarios = new ArrayList<>();
    public void salva(Usuario usuario) {
        usuarios.add(usuario);

    }


    public List<Usuario> todos() {
        return new ArrayList<>(usuarios);
    }
}
