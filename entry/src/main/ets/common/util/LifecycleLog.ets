export default class LifeCycleLog {
  // A static array to store log messages
  static logs: string[] = [];

  // Static method to add a new log message
  static add(message: string) {
    // Get the current time (hours:minutes:seconds format)
    const timestamp = new Date().toLocaleTimeString();
    // Insert the new message at the beginning of the array with timestamp
    LifeCycleLog.logs.unshift(`[${timestamp}] ${message}`);
    // If there are more than 20 logs, remove the oldest one
    if (LifeCycleLog.logs.length > 20) {
      LifeCycleLog.logs.pop();
    }
  }

  // Static method to return all stored logs
  static getAll(): string[] {
    return LifeCycleLog.logs;
  }

  // Static method to clear all logs
  static clear() {
    LifeCycleLog.logs = [];
  }
}