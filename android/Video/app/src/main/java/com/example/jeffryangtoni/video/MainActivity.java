package com.example.jeffryangtoni.video;

import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.MediaController;
import android.widget.VideoView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        VideoView videoView = findViewById(R.id.videoView);
        MediaController mediaController = new MediaController(this);
        mediaController.setAnchorView(videoView);

        // from internet
//        Uri uri = Uri.parse("http://androiddevcourse.com/demovideo.mp4");
//        videoView.setVideoURI(uri);

        videoView.setVideoPath("android.resource://" + getPackageName() + "/" + R.raw.demovideo);
        videoView.setMediaController(mediaController);
        videoView.start();
    }
}
