### HWSemgentMenuView

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fba2c5v%2FbtqF9DegbAn%2FPOGSgz9rZk8wM6h1GHlCgk%2Fimg.gif)

많은 메뉴를 표시해야할 일이 많아져서 만들어 본것... 인데
> 주의: 외부 공개용으로 **잘** 만들어진게 아니라, 개인적인 제작 레벨이라 좀 코드가 더럽습니다.

나머지는  [여기서 보세요](https://me.innori.com/2685) 

### HOW TO USE

UIView 상속이라 UI 빌더에서는 UIView 배치후 클래스명만 교체하면 됩니다.
>  (@IBDesignable 은 따로 추가하지 않았습니다.)

디자인 설정

- font (UIFont): 해당 메뉴의 기본 폰트를 지정합니다. 미지정시 기본은  `UIFont.systemFont(ofSize: 15)` 으로 구성 되어있습니다.
- menuColor: 버튼(메뉴들)의 기본 색상 폰트입니다. 기본은 `UIColor.black` 으로 지정되어있음
- deActiveColor: 미지정된 버튼들의 색상입니다. 기본은 `UIColor.black.withAlphaComponent(0.3)` 으로 지정되어있음.
- indicatorColor: 버튼 하단에 현 선택에 대한 바에 대한 컬러입니다. 기본은 `UIColor.lightGray` 으로 지정되어있음
- indicatorHeight: 버튼 하단에 현 선택에 대한 바의 높이 입니다. 기본은 `2`으로 지정되어있음.
- menuInset: 버튼들 내용의 각각 UIEdgeInsets 입니다 상하좌우 지정이 가능하며 기본은 `.zero`로 설정되어있음.


텍스트 설정 

```
set(menus: [String], action: HWSemgentMenuViewMenuSelectIndexHandler?)
```

- menus 에는 [String] 을 넣습니다.
-   action은 optional 인 closure 구성으로  `((_ index: Int) -> Void)` 형식으로 반환하고 있습니다.   (위 string array 의 index을 반환)