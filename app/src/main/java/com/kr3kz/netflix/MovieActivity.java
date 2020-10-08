package com.kr3kz.netflix;

import androidx.appcompat.app.AppCompatActivity;

import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MovieActivity extends AppCompatActivity {
    String url = "http://172.16.47.14/movie/";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Number id = (getIntent().getIntExtra("id", -1)) + 1;
        url = url + id;
        getServerDataJson(url);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.movie_activity);
    }

    private String getServerDataJson(String urlString) {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        InputStream is = null;
        String ch = "";

        try {
            // Echange HTTP avec le serveur
            URL url = new URL(urlString);
            HttpURLConnection connexion = (HttpURLConnection) url.openConnection();
            connexion.connect();
            is = connexion.getInputStream();

            // Exploitation réponse texte brut
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String ligne;
            while ((ligne = br.readLine()) != null) {
                ch = ch + ligne + "\n";
            }
        } catch (Exception expt) {
            Log.e("log_tag", "Erreur pendant la récupération des données : " + expt.toString());
        };

        // Parse les données JSON
        try {
            JSONArray jArray = new JSONArray(ch);
            ch = "";
            for (int i = 0; i < jArray.length(); i++) {
                JSONObject jsonData = jArray.getJSONObject(i);
                ch = ch + "- " + jsonData.getString("id") + "\n";
                ch = ch + "- " + jsonData.getString("name") + "\n";
                ch = ch + "- " + jsonData.getString("duration") + "\n";
                ch = ch + "- " + jsonData.getString("release_date") + "\n";
                ch = ch + "- " + jsonData.getString("image_b64") + "\n";
            }
        } catch (JSONException e) {
            Log.e("log_tag", "Erreur pendant l'analyse des données : " + e.toString());
        }
        System.out.println(ch);
        return (ch);
    }
}