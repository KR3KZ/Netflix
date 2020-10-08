package com.kr3kz.netflix;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_activity);

        for (int i = 0; i < 10 ; i++) {
            LinearLayout L = findViewById(R.id.main_activity_layout);
            Button B = new Button(this);
            B.setText("Film " + (i + 1));
            B.setTag(i);
            B.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent(getApplicationContext(), MovieActivity.class);
                    intent.putExtra("id", (int) view.getTag());
                    overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
                    startActivity(intent);
                }
            });
            L.addView(B);
        }
    }
}