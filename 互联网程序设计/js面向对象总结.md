## ˵��
��$��ͷ����$��β�Ĳ����Ǵ��������Ҫ�滻�Ĳ��֡�
## �̳�
### ����̳а�������
``` js
var __extends = (this && this.__extends) || function (self, _super) {
    for (var prop in _super) 
        if (super.hasOwnProperty(prop))
            self[prop] = _super[prop];
    function newPrototype() {
        this.constructor = self; 
    }
    self.prototype = _super === null ? Object.create(_super) : (newPrototype.prototype = _super.prototype, new newPrototype());
};
```
### ʹ�ü̳�
```js
var $����$ = (function (_super) {
    __extends($����$, _super);
    // ���캯��
    function $����$() {
        // ����û�����Ĺ��캯��
        return _super.apply(this, arguments) || this; 
        // ����в�����
        return _super.call(this, $����$, ...) || this;
    }
    return $����$;
}($������$));
```
## ����
```js
Object.defineProperty($����$.prototype, "$������$", {
    get: function () {
        // TODO: ��д���Ե� get ��
    },
    set: function (value) {
        // TODO: ��д���Ե� set ��
    },
    enumerable: true,
    configurable: true
});
```
## ��̬����
```js
$����$.$������$ = function () { };
```
## ʵ������
```js
$����$.prototype.$������$ = function () { };
```
## ��͹��캯��
```js
var $����$ = (function () {
    function $����$() {
        // TODO: ��ʼ�� $����$ ��
    }
    return $����$;
    // ������ǹ��еľ�д��һ�еĴ���
    $�ϼ������ռ�$.$����$ = $����$
}());
```
## �����ռ�
```js
var $�����ռ�$;
(function ($�����ռ�$) {

})($�����ռ�$ || ($�����ռ�$ = {}));
```
## ����
```js
var $����$ = $�����ռ������$;
```
## ���Ƿ���
```js
$����$.prototype.$������$ = function ($����$) {
    var result = _super.prototype.$������$.call(this, $����$);
};
```