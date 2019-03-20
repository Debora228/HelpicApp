package br.com.helpdvs.helpoc.model;

import androidx.annotation.NonNull;

public class Usuario {
    private final String nome;
    private final String telefone;
    private final String email;

    public Usuario(String nome, String telefone, String email) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
    }

    @NonNull
    @Override
    public String toString() {
        return nome;
    }
}
