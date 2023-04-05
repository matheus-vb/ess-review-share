import { User } from "@prisma/client";
import { IUserRepository } from "../repositories/IUsersRepository";
import { hash } from "bcryptjs";

interface IRegisterUserUseCaseRequest {
    name: string
    username: string
    email: string
    password: string
    birthdate: Date
    phone: string | null
    location: string | null
}

interface IRegisterUserUseCaseReply {
    user: User
}

export class RegisterUserUseCase {
    constructor(private usersRepository: IUserRepository) { }

    async handle({
        name,
        email,
        username,
        birthdate,
        password,
        location,
        phone,
    }: IRegisterUserUseCaseRequest): Promise<IRegisterUserUseCaseReply> {

        const password_hash = await hash(password, 6);

        const user = await this.usersRepository.create({
            name,
            email,
            username,
            birthdate,
            password: password_hash,
            location,
            phone,
        })

        return {
            user,
        }
    }
}