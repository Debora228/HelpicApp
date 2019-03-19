package br.com.helpdvs.helpoc.ui.activity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import br.com.helpdvs.helpoc.R;


public class ListaAlunosActivity extends AppCompatActivity{

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
          super.onCreate(savedInstanceState);
//        Toast.makeText(this, "BEM VINDO AO HELPIC!!", Toast.LENGTH_LONG).show();
//        TextView aluno = new TextView(this);
//        aluno.setText("HELPIC DEV TEAM");
          setContentView(R.layout.activity_lista_alunos);
          setTitle("HELPIC");
          List<String> alunos = new ArrayList<>(
                  Arrays.asList("Helpic","O que é fotografia?","Fotografia"));
//        TextView primeiroAluno = findViewById(R.id.textView);
//        TextView segundoAluno = findViewById(R.id.textView3);
//        TextView terceiroAluno = findViewById(R.id.textView2);
//
//        primeiroAluno.setText(alunos.get(0));
//        segundoAluno.setText(alunos.get(1));
//        terceiroAluno.setText(alunos.get(2));
        ListView listaDeAlunos = findViewById(R.id.activity_lista_alunos_listview);
        listaDeAlunos.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, alunos));
    }

}
