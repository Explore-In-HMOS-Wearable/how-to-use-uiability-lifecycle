import LifeCycleLog from '../common/util/LifeCycleLog';

/**
 * Entry point of the application.
 * Displays and refreshes UIAbility lifecycle logs.
 */
@Entry
@Component
struct Index {
  /**
   * Stores the lifecycle logs to be displayed in the UI.
   */
  @State logs: string[] = LifeCycleLog.getAll();

  /**
   * Updates the log list by retrieving the latest lifecycle logs.
   */
  updateLog() {
    this.logs = [...LifeCycleLog.getAll()];
  }

  /**
   * Builds the user interface for displaying lifecycle logs and a refresh button.
   * @returns The UI layout.
   */
  build() {
    Column() {
      Text($r('app.string.title_text'))
        .fontSize($r('app.float.large_font_size'))
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .margin({ top: ($r('app.float.margin_top')) })
        .textAlign(TextAlign.Center)
        .width('50%')

      Button($r('app.string.refresh_button'))
        .margin($r('app.float.margin_small'))
        .onClick(() => this.updateLog())
        .fontSize($r('app.float.medium_font_size'))
        .height('12%')

      Scroll() {
        Column() {
          ForEach(this.logs, (item: string) => {
            Text(item)
              .fontSize($r('app.float.small_font_size'))
              .fontColor(Color.Gray)
              .margin({ bottom: ($r('app.float.margin_bottom')) })
          })
        }.padding($r('app.float.padding_small'))
      }.height('40%')
      .width('60%')
      .backgroundColor($r('app.color.main_background'))
      .borderRadius($r('app.float.border_radius'))
    }
    .align(Alignment.Top)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}