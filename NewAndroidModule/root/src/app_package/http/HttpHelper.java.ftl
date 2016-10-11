package ${packageName}.http;

import android.support.annotation.NonNull;
import ${packageName}.App;
import ${packageName}.config.UrlConfig;
import com.google.gson.GsonBuilder;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;
import javax.net.ssl.X509TrustManager;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

public class HttpHelper {

    private static volatile HttpHelper singleton;
    private RetrofitApiService service;
    private HttpHelper() {
        service=getRetrofitApiService();
    }

    public static HttpHelper getInstance() {
        if (singleton == null) {
            synchronized (HttpHelper.class) {
                if (singleton == null) {
                    singleton = new HttpHelper();
                }
            }
        }
        return singleton;
    }

    /**
     * 添加安全证书时需要使用
     * @return 添加了安全证书的client
     */
    private OkHttpClient createClient() {
        OkHttpClient client = new OkHttpClient
                .Builder()
                //忽略域名验证
                .hostnameVerifier(new HostnameVerifier() {
                    @Override
                    public boolean verify(String hostname, SSLSession session) {
                        //添加域名验证,这里是默认所有的都信任
                        return true;
                    }
                })
                //添加安全证书
                .sslSocketFactory(SSLHelper.getSSLCertificate(App.getInstance()), new X509TrustManager() {
                    @Override
                    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {

                    }

                    @Override
                    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {

                    }

                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return new X509Certificate[0];
                    }
                })
                .build();
        return client;
    }


    private RetrofitApiService getRetrofitApiService() {
        return getRetrofit().create(RetrofitApiService.class);
    }

    @NonNull
    private Retrofit getRetrofit() {
        return new Retrofit
                .Builder()
                //配置基础的url
                .baseUrl(UrlConfig.BASE_URL)
                //配置提交或者返回的参数的造型方式为gson
                .addConverterFactory(GsonConverterFactory.create(new GsonBuilder().serializeNulls().create()))
                //返回值可以使用Obserable
                .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
                //使用https时需要配置
                .client(new OkHttpClient())
                .build();
    }

    /**
     *方法举例说明,这里直接使用了rxjava进行回调
     public Observable<String> getRecommend(String gender) {
     return service.getRecomend(gender);
     }
     */

}
