package ${packageName}.http;

import android.content.Context;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManagerFactory;
import okio.Buffer;

/**
 *创建带有安全证书时使用,配置到okhttpclient中在httphelper中配置
 *
 */

public class SSLHelper {
    /**
     * 创建信任的自签名证书
     *
     * @param context
     * @return
     */
    public static SSLSocketFactory getSSLCertificate(Context context) {
        SSLSocketFactory sslSocketFactory = null;
        try {
            //该数字证书遵循x.509标准,创建x.509标准的数字证书工厂
            CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
            //得到数字证书的流
//            InputStream caInput = context.getResources().openRawResource(R.raw.tomcat);
            InputStream caInput = new Buffer()
                    .writeUtf8(CerConfig.CER)
                    .inputStream();
            //数字证书
            Certificate ca = null;
            try {
                //添加数字证书
                ca = certificateFactory.generateCertificate(caInput);
            } catch (CertificateException e) {
                e.printStackTrace();
            } finally {
                caInput.close();
            }
            //数字证书仓库的类型
            String keyStoreType = KeyStore.getDefaultType();
            //得到密钥
            KeyStore keyStore = KeyStore.getInstance(keyStoreType);
            //数字证书加载,加载的流以及密码,创建一个空的证书仓库
            keyStore.load(null, null);
            if (ca == null) {
                return null;
            }
            //给定证书的别名,添加证书到该仓库
            keyStore.setCertificateEntry("ca", ca);
            //得到默认的算法
            String algorithm = TrustManagerFactory.getDefaultAlgorithm();
            //默认信任的工厂
            TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(algorithm);
            //添加该密钥的信任
            trustManagerFactory.init(keyStore);
            //TLS协议安全传输层协议 Transport Layer Security Protocol
            SSLContext sslContext = SSLContext.getInstance("TLS");
            //
            sslContext.init(null, trustManagerFactory.getTrustManagers(), null);
            //创建工厂
            sslSocketFactory = sslContext.getSocketFactory();
        } catch (CertificateException | IOException | KeyStoreException | NoSuchAlgorithmException | KeyManagementException e) {
            e.printStackTrace();
        }

        return sslSocketFactory;
    }
}
