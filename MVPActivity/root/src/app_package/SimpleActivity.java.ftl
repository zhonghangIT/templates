package ${packageName};
import android.os.Bundle;

public class ${activityClass} extends BaseActivity implements ${contractClass}.View {
    private ${contractClass}.Presenter mPresenter;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mPresenter = new ${presenterClass}();
        mPresenter.attachView(this);
    }

    @Override
    public int getLayoutId() {
        return R.layout.${layoutName};
    }

    @Override
    public void initViews() {

    }

    @Override
    public void initData() {

    }

    @Override
    public void onDestroy() {
      super.onDestroy();
      mPresenter.detachView();
    }
}
