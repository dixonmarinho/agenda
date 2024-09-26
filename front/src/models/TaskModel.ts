import { ResourceModel } from "./ResourceModel";

export class Tasks extends ResourceModel<Tasks> {
    public firstName!: string;
    public lastName!: string;
    public email!: string;
  
    constructor(model?: Partial<Tasks>) {
      super(model);
    }
  }