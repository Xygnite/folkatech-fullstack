<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Product;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        \App\Models\User::factory()->create([
            'name' => 'Rico',
            'last_name' => 'Gunawan',
            'phone_number' => '6282219458427',
            'password' => 'r1c04dy714',
            'email' => 'riconaxxbze@gmail.com',

        ]);
        Product::factory(12)->create();
    }
}