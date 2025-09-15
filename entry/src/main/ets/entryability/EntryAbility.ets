import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import LifecycleLog from '../common/util/LifecycleLog';
import { UIAbility } from '@kit.AbilityKit';

export default class EntryAbility extends UIAbility {
  // Property to store a reference to the window stage
  windowStage: window.WindowStage | undefined;

  // Called when the ability is first created
  onCreate(): void {
    hilog.info(0x0000, 'EntryAbility', 'onCreate called');
    LifecycleLog.add('🔵 onCreate: Ability created.');
  }

  // Called when a WindowStage (UI window) is created
  onWindowStageCreate(windowStage: window.WindowStage) {
    this.windowStage = windowStage;
    LifecycleLog.add('🟢 onWindowStageCreate: Window created.');

    try {
      windowStage.on('windowStageEvent', (data) => {
        LifecycleLog.add(`🌀 windowStageEvent: ${JSON.stringify(data)}`);
      });
    } catch (e) {
      LifecycleLog.add(`❌ Failed to subscribe to windowStageEvent: ${JSON.stringify(e)}`);
    }

    // Load the main UI content (Index page) into the window stage
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        LifecycleLog.add(`❌ Failed to load content: ${JSON.stringify(err)}`);
      } else {
        LifecycleLog.add('✅ Content loaded.');
      }
    });
  }

  // Called when the app comes to the foreground
  onForeground() {
    LifecycleLog.add('🟩 onForeground: App brought to foreground.');
  }

  // Called when the app goes to the background
  onBackground() {
    LifecycleLog.add('🟥 onBackground: App sent to background.');
  }

  // Called when the window stage is destroyed
  onWindowStageDestroy() {
    LifecycleLog.add('⚠️ onWindowStageDestroy: WindowStage destroyed.');
    // Unsubscribe from windowStageEvent to prevent memory leaks
    this.windowStage?.off('windowStageEvent');
  }

  // Called when the ability is destroyed
  onDestroy() {
    LifecycleLog.add('❌ onDestroy: Ability destroyed.');
  }
}