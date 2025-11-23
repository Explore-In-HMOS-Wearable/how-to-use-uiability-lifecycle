import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import LifeCycleLog from '../common/util/LifeCycleLog';
import { UIAbility } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  // Property to store a reference to the window stage
  windowStage: window.WindowStage | undefined;

  // Called when the ability is first created
  onCreate(): void {
    hilog.info(0x0000, 'EntryAbility', 'onCreate called');
    LifeCycleLog.add('🔵 onCreate: Ability created.');
  }

  // Called when a WindowStage (UI window) is created
  onWindowStageCreate(windowStage: window.WindowStage) {
    this.windowStage = windowStage;
    LifeCycleLog.add('🟢 onWindowStageCreate: Window created.');

    try {
      windowStage.on('windowStageEvent', (data) => {
        LifeCycleLog.add(`🌀 windowStageEvent: ${JSON.stringify(data)}`);
      });
    } catch (e) {
      LifeCycleLog.add(`❌ Failed to subscribe to windowStageEvent: ${JSON.stringify(e)}`);
    }

    // Load the main UI content (Index page) into the window stage
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        LifeCycleLog.add(`❌ Failed to load content: ${JSON.stringify(err)}`);
      } else {
        LifeCycleLog.add('✅ Content loaded.');
      }
    });
  }

  // Called when the app comes to the foreground
  onForeground() {
    LifeCycleLog.add('🟩 onForeground: App brought to foreground.');
  }

  // Called when the app goes to the background
  onBackground() {
    LifeCycleLog.add('🟥 onBackground: App sent to background.');
  }

  // Called when the window stage is destroyed
  onWindowStageDestroy() {
    LifeCycleLog.add('⚠️ onWindowStageDestroy: WindowStage destroyed.');
    // Unsubscribe from windowStageEvent to prevent memory leaks
    this.windowStage?.off('windowStageEvent');
  }

  // Called when the ability is destroyed
  onDestroy() {
    LifeCycleLog.add('❌ onDestroy: Ability destroyed.');
  }
}