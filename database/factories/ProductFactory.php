<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->unique()->firstName(),
            'vendor' => fake()->unique()->company(),
            'rating' => fake()->unique()->randomFloat(1, 0, 5),
            'price' => fake()->unique()->randomFloat(0, 100000, 500000),
            'img_paths' => json_encode([fake()->unique()->filePath()]),
            'description' => fake()->unique()->paragraph(50),
        ];
    }
}