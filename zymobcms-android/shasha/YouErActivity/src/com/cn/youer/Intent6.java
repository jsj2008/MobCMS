package com.cn.youer;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class Intent6 extends Activity {
	TextView  tv;
	Button fanhui;
    Button zixun;
 @Override
protected void onCreate(Bundle savedInstanceState) {
	// TODO Auto-generated method stub
	super.onCreate(savedInstanceState);
	requestWindowFeature(Window.FEATURE_NO_TITLE);
	setContentView(R.layout.intent6);
	tv=(TextView) findViewById(R.id.text1);
    zixun=(Button) findViewById(R.id.fufanzixun);
    zixun.setOnClickListener(new OnClickListener() {
		
		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			Uri  uri=Uri.parse("smsto:18912294545");
			Intent  intent=new Intent(Intent.ACTION_SENDTO,uri);
			intent.putExtra("sms_body", "THE.SMS  text");
			startActivity(intent);
		}
	});
    //把本身activity添加到exit_app里面addActivity的数组中
    Exit_app.getInstance().addActivity(Intent6.this);
    tv.setText("\t"+"精心设计的配方, 含有绝佳的霍霍巴"+"\n"
   		        +"\t"+"油, 保湿因子km-30等, 能延迟保湿功" +"\n"
   		        +"\t"+"能, 如水晶般透明的露珠, 轻透水性质" +"\n"
   		        +"\t"+"地, 滋润肌肤, 给肌肤喝上足足的水" +"\n"
   		        +"\t"+"分, 带给肌肤舒适的滋润感, 令肌肤整" +"\n"
   		        +"\t"+"天保持晶莹剔透的状态, 呈现不可思议" +"\n"
   		        +"\t"+"的水嫩效果!" );
    fanhui=(Button) findViewById(R.id.fufan1);
    fanhui.setOnClickListener(new OnClickListener() {
		
		@Override
		public void onClick(View v) {
			// TODO Auto-generated method stub
			Intent in=new Intent(Intent6.this, YouErActivity.class);
			startActivity(in);
		}
	});
}
public void danjijianjie(View v){
		Intent in;
		switch (v.getId()) {
		case R.id.bt2:
			in=new Intent(Intent6.this, Introduce.class);
			startActivity(in);
			break;
		case R.id.bt3:
			in=new Intent(Intent6.this, Online.class);
			startActivity(in);
			break;
		case R.id.bt4:
			in=new Intent(Intent6.this, Phone.class);
			startActivity(in);
			break;
		case R.id.bt5:
			in=new Intent(Intent6.this, More.class);
			startActivity(in);
			break;

		}
   }
}
