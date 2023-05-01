package com.example.myapplication;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView text = findViewById(R.id.text);
        text.setMovementMethod(new ScrollingMovementMethod());

        Button button_plus = findViewById(R.id.button_plus);
        Button button_minus = findViewById(R.id.button_minus);
        Button button_divide = findViewById(R.id.button_divide);
        Button button_multi= findViewById(R.id.button_multi);
        Button button_equal = findViewById(R.id.button_equal);
        Button button_1 = findViewById(R.id.button_1);
        Button button_2 = findViewById(R.id.button_2);
        Button button_3 = findViewById(R.id.button_3);
        Button button_4 = findViewById(R.id.button_4);
        Button button_5 = findViewById(R.id.button_5);
        Button button_6 = findViewById(R.id.button_6);
        Button button_7 = findViewById(R.id.button_7);
        Button button_8 = findViewById(R.id.button_8);
        Button button_9 = findViewById(R.id.button_9);
        Button button_0 = findViewById(R.id.button_0);
        Button button_point = findViewById(R.id.button_point);
        Button button_backspace = findViewById(R.id.button_backspace);
        Button button_next = findViewById(R.id.button_next);

        button_next.setOnClickListener(view -> {
            Intent fp=new Intent(getApplicationContext(),MainActivity2.class);
            startActivity(fp);
        });

        button_plus.setOnClickListener(view -> {
            text.setText(text.getText()+"+");
        });

        button_minus.setOnClickListener(view -> {
            text.setText(text.getText()+"-");
        });

        button_divide.setOnClickListener(view -> {
            text.setText(text.getText()+"/");
        });

        button_multi.setOnClickListener(view -> {
            text.setText(text.getText()+"*");
        });

        button_point.setOnClickListener(view -> {
            text.setText(text.getText()+".");
        });

        button_1.setOnClickListener(view -> {
            text.setText(text.getText()+"1");
        });

        button_2.setOnClickListener(view -> {
            text.setText(text.getText()+"2");
        });

        button_3.setOnClickListener(view -> {
            text.setText(text.getText()+"3");
        });

        button_4.setOnClickListener(view -> {
            text.setText(text.getText()+"4");
        });

        button_5.setOnClickListener(view -> {
            text.setText(text.getText()+"5");
        });

        button_6.setOnClickListener(view -> {
            text.setText(text.getText()+"6");
        });

        button_7.setOnClickListener(view -> {
            text.setText(text.getText()+"7");
        });

        button_8.setOnClickListener(view -> {
            text.setText(text.getText()+"8");
        });

        button_9.setOnClickListener(view -> {
            text.setText(text.getText()+"9");
        });

        button_0.setOnClickListener(view -> {
            text.setText(text.getText()+"0");
        });

        button_backspace.setOnClickListener(view -> {
            if (text.getText().length() > 0) {
                text.setText(text.getText().subSequence(0,text.getText().length()-1));
            }
        });

        button_equal.setOnClickListener(view -> {
            try {
                double num = eval(text.getText().toString());
                if (Double.isNaN(num) && Double.isInfinite(num) && Double.isFinite(num)){
                    Toast toast = Toast.makeText(this, "Деление на 0 невозможно", Toast.LENGTH_LONG);
                    toast.show();
                } else {
                    text.setText(new BigDecimal(num).setScale(2, BigDecimal.ROUND_DOWN).toPlainString());
                }
            } catch (Exception exception) {
                Toast toast = Toast.makeText(this, exception.toString(), Toast.LENGTH_LONG);
                toast.show();
            }
        });

    }

    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString("text",findViewById(R.id.text).toString());
    }

    @Override
    protected void onRestoreInstanceState(@NonNull Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        TextView textView = findViewById(R.id.text);
        textView.setText(savedInstanceState.getString("text"));
    }

    public static double eval(final String str) {
        return new Object() {
            int pos = -1, ch;

            void nextChar() {
                ch = (++pos < str.length()) ? str.charAt(pos) : -1;
            }

            boolean eat(int charToEat) {
                while (ch == ' ') nextChar();
                if (ch == charToEat) {
                    nextChar();
                    return true;
                }
                return false;
            }

            double parse() {
                nextChar();
                double x = parseExpression();
                if (pos < str.length()) throw new RuntimeException("Unexpected: " + (char)ch);
                return x;
            }

            // Grammar:
            // expression = term | expression `+` term | expression `-` term
            // term = factor | term `*` factor | term `/` factor
            // factor = `+` factor | `-` factor | `(` expression `)`
            //        | number | functionName factor | factor `^` factor

            double parseExpression() {
                double x = parseTerm();
                for (;;) {
                    if      (eat('+')) x += parseTerm(); // addition
                    else if (eat('-')) x -= parseTerm(); // subtraction
                    else return x;
                }
            }

            double parseTerm() {
                double x = parseFactor();
                for (;;) {
                    if      (eat('*')) x *= parseFactor(); // multiplication
                    else if (eat('/')) x /= parseFactor(); // division
                    else return x;
                }
            }

            double parseFactor() {
                if (eat('+')) return parseFactor(); // unary plus
                if (eat('-')) return -parseFactor(); // unary minus

                double x;
                int startPos = this.pos;
                if (eat('(')) { // parentheses
                    x = parseExpression();
                    eat(')');
                } else if ((ch >= '0' && ch <= '9') || ch == '.') { // numbers
                    while ((ch >= '0' && ch <= '9') || ch == '.') nextChar();
                    x = Double.parseDouble(str.substring(startPos, this.pos));
                } else if (ch >= 'a' && ch <= 'z') { // functions
                    while (ch >= 'a' && ch <= 'z') nextChar();
                    String func = str.substring(startPos, this.pos);
                    x = parseFactor();
                    switch (func) {
                        case "sqrt":
                            x = Math.sqrt(x);
                            break;
                        case "sin":
                            x = Math.sin(Math.toRadians(x));
                            break;
                        case "cos":
                            x = Math.cos(Math.toRadians(x));
                            break;
                        case "tan":
                            x = Math.tan(Math.toRadians(x));
                            break;
                        default:
                            throw new RuntimeException("Unknown function: " + func);
                    }
                } else {
                    throw new RuntimeException("Unexpected: " + (char)ch);
                }

                if (eat('^')) x = Math.pow(x, parseFactor()); // exponentiation

                return x;
            }
        }.parse();
    }


}