package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        TextView text_result = findViewById(R.id.text_result);

        EditText num1 = findViewById(R.id.num1);
        EditText num2 = findViewById(R.id.num2);

        Button button_result = findViewById(R.id.button_result);
        Button button_prev = findViewById(R.id.button_prev);

        button_result.setOnClickListener(view -> {
            int int1 = Integer.parseInt(num1.getText().toString());
            int int2 = Integer.parseInt(num2.getText().toString());
            try{
                int result = int1 % int2;
                text_result.setText("Результат: " + result);
                num1.setText("");
                num2.setText("");
            } catch (Exception exception) {
                Toast.makeText(this, exception.toString(), Toast.LENGTH_LONG).show();
            }
        });

        button_prev.setOnClickListener(view -> {
            finish();
        });

    }
}