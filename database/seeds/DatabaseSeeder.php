<?php

use Illuminate\Database\Seeder;
Use App\User;
Use App\UserInfo;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UserTableSeeder::class);
        $this->call(UserInfoTableSeeder::class);
    }
}


class UserTableSeeder extends Seeder
{
    public function run()
    {
        User::create(array(
            'name'  => 'Admin',
            'email' => 'admin@namespace.com',
            'password'   => Hash::make('admin'),
            'admin_rights' => '1'
        ));

        User::create(array(
            'name'  => 'Anton Zemlyanukhin',
            'email' => 'anton.zemlya@gmail.com',
            'password'   => Hash::make('vE1tPU9z'),
            'admin_rights' => '0'
        ));
    }

}

class UserInfoTableSeeder extends Seeder
{
    public function run()
    {
        UserInfo::create();
        UserInfo::create();
    }
}