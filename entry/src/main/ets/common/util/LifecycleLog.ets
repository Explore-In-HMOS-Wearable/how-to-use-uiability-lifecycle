// Export the LifecycleLog class as default
export default class LifecycleLog {
  // A static array to store log messages
  static logs: string[] = [];

  // Static method to add a new log message
  static add(message: string) {
    // Get the current time (hours:minutes:seconds format)
    const timestamp = new Date().toLocaleTimeString();
    // Insert the new message at the beginning of the array with timestamp
    LifecycleLog.logs.unshift(`[${timestamp}] ${message}`);
    // If there are more than 20 logs, remove the oldest one
    if (LifecycleLog.logs.length > 20) {
      LifecycleLog.logs.pop();
    }
  }

  // Static method to return all stored logs
  static getAll(): string[] {
    return LifecycleLog.logs;
  }

  // Static method to clear all logs
  static clear() {
    LifecycleLog.logs = [];
  }
}