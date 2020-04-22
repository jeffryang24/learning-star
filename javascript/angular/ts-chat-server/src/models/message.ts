import { User } from "./user";

export class Message {
    constructor(private from: User, private content: String) {}
}
