http://www.cnblogs.com/firege/p/5748480.html

总结一下，由GPIO的结构决定了GPIO可以配置成以下模式：

1. 输入模式(上拉/下拉/浮空)

  在输入模式时，施密特触发器打开，输出被禁止。数据寄存器每隔1个AHB1时钟周期更新一次，可
  通过输入数据寄存器GPIOx_IDR读取I/O状态。其中AHB1的时钟如按默认配置一般为180MHz。

  用于输入模式时，可设置为上拉、下拉或浮空模式。

2. 输出模式(推挽/开漏，上拉/下拉)

  在输出模式中，输出使能，推挽模式时双MOS管以方式工作，输出数据寄存器GPIOx_ODR可控制I/O输出高低电平。开漏模式时，只有N-MOS管工作，输出数据寄存器可控制I/O输出高阻态或低电平。输出速度可配置，有2MHz\25MHz\50MHz\100MHz的选项。此处的输出速度即I/O支持的高低电平状态最高切换频率，支持的频率越高，功耗越大，如果功耗要求不严格，把速度设置成最大即可。

  此时施密特触发器是打开的，即输入可用，通过输入数据寄存器GPIOx_IDR可读取I/O的实际状态。

  用于输出模式时，可使用上拉、下拉模式或浮空模式。但此时由于输出模式时引脚电平会受到ODR寄存器影响，而ODR寄存器对应引脚的位为0，即引脚初始化后默认输出低电平，所以在这种情况下，上拉只起到小幅提高输出电流能力，但不会影响引脚的默认状态。

3. 复用功能(推挽/开漏，上拉/下拉)

  复用功能模式中，输出使能，输出速度可配置，可工作在开漏及推挽模式，但是输出信号源于其它外设，输出数据寄存器GPIOx_ODR无效；输入可用，通过输入数据寄存器可获取I/O实际状态，但一般直接用外设的寄存器来获取该数据信号。

  用于复用功能时，可使用上拉、下拉模式或浮空模式。同输出模式，在这种情况下，初始化后引脚默认输出低电平，上拉只起到小幅提高输出电流能力，但不会影响引脚的默认状态。

4. 模拟输入输出

  模拟输入输出模式中，双MOS管结构被关闭，施密特触发器停用，上/下拉也被禁止。其它外设通过模拟通道进行输入输出。

  通过对GPIO寄存器写入不同的参数，就可以改变GPIO的应用模式，再强调一下，要了解具体寄存器时一定要查阅《STM32F4xx参考手册》中对应外设的寄存器说明。在GPIO外设中，通过设置"模式寄存器GPIOx_MODER"可配置GPIO的输入/输出/复用/模拟模式，"输出类型寄存器GPIOx_OTYPER"配置推挽/开漏模式，配置"输出速度寄存器GPIOx_OSPEEDR"可选2/25/50/100MHz输出速度，"上/下拉寄存器GPIOx_PUPDR"可配置上拉/下拉/浮空模式，

[粒子](http://www.cnblogs.com/whik/p/6672730.html)

``` C

#define LED_ON GPIO_SetBits(GPIOD, GPIO_Pin_13)        //端口置1
#define LED_OFF GPIO_ResetBits(GPIOD, GPIO_Pin_13)     //端口置0

void delay(u32 t)            //延时函数
{
    u16 i;
    while(t--)
        for(i=0;i<1000;i++);
}

void GPIO_Config(void)                            //GPIO初始配置
{
    GPIO_InitTypeDef GPIO_InitStructure;　　　　　　//定义结构体变量

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD, ENABLE); //使能GPIOD的时钟

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;                    //指定引脚13
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;        //设置输出速率50MHz
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;        //推挽输出模式
    GPIO_Init(GPIOD, &GPIO_InitStructure);                            //初始化外设GPIOx寄存器
}

int main()
{
    GPIO_Config();            //GPIOD_1初始化配置
    while(1)
    {
        LED_ON;                    //点亮
        delay(1000);　　　　　　　　　//延时大概几百毫秒
        LED_OFF;                //熄灭
        delay(1000);
    }

}
```
