package br.com.helpdvs.helpoc.ui.activity;

import androidx.appcompat.app.AppCompatActivity;
import br.com.helpdvs.helpoc.R;
import br.com.helpdvs.helpoc.dao.UsuarioDAO;
import br.com.helpdvs.helpoc.model.Usuario;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.util.List;

public class FormularioAlunoActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_formulario_aluno);

        final UsuarioDAO dao = new UsuarioDAO();

        final EditText campoNome = findViewById(R.id.activity_formulario_aluno_nome);
        final EditText campoTelefone = findViewById(R.id.activity_formulario_aluno_telefone);
        final EditText campoEmail = findViewById(R.id.activity_formulario_aluno_email);
        setTitle("Cadastro de usuário");

        Button botaoSalvar = findViewById(R.id.activity_formulario_aluno_botao_salvar);
        botaoSalvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String nome = campoNome.getText().toString();
                String telefone = campoTelefone.getText().toString();
                String email = campoEmail.getText().toString();

                Usuario usuarioCriado = new Usuario(nome, telefone, email);
                dao.salva(usuarioCriado);

                startActivity(new Intent(FormularioAlunoActivity.this, ListaAlunosActivity.class));
//                Toast.makeText(FormularioAlunoActivity.this, "Salvando", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
