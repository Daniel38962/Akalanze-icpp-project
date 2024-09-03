import Buffer "mo:base/Buffer";
import Text "mo:base/Text";

actor {
  type Task = {
    id: Nat;
    description: Text;
    completed: Bool;
  };

  var tasks = Buffer.Buffer<Task>(0);

  public func addTask(description: Text) : async Nat {
    let id = tasks.size();
    let newTask: Task = {
      id;
      description;
      completed = false;
    };
    tasks.add(newTask);
    id
  };

  public func completeTask(id: Nat) : async Bool {
    if (id >= tasks.size()) return false;
    let task = tasks.get(id);
    let updatedTask: Task = {
      id = task.id;
      description = task.description;
      completed = true;
    };
    tasks.put(id, updatedTask);
    true
  };

  public query func getTasks() : async [Task] {
    Buffer.toArray(tasks)
  };
}