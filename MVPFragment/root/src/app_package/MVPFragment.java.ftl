package ${packageName};

import android.os.Bundle;

/**
 *
 */
public class ${className} extends BaseFragment implements ${contractClass}.View {
    private static final String ARG_TITLE = "fragment_title";
    private String mTitle;
    private ${contractClass}.Presenter mPresenter;

    public ${className}() {

    }

    /**
     *创建一个静态方法用于创建fragment的对象
     * @title 该fragment的标题
     * @return 一个该对象的新的实例
     */
    public static ${className} newInstance(String title) {
        ${className} fragment = new ${className}();
        Bundle args = new Bundle();
        args.putString(ARG_TITLE, title);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mTitle = getArguments().getString(ARG_TITLE);
        }
        mPresenter = new ${presenterClass}();
        mPresenter.attachView(this);
    }

    @Override
    public void initViews() {

    }

    @Override
    public void initData() {

    }

    @Override
    public int getLayoutId() {
        return R.layout.${fragmentName};
    }
    @Override
    public void onDestroy() {
        super.onDestroy();
        mPresenter.detachView();
    }
}
