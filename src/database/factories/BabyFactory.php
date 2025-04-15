<?php

namespace Database\Factories;

use App\Models\Baby;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Baby>
 */
class BabyFactory extends Factory
{
    public function definition(): array
    {
        return [
            'name' => "{$this->faker->firstName()} {$this->faker->lastName()}",
            'dob' => $this->faker
                ->dateTimeBetween(startDate: '-30 days')
                ->format('Y-m-d'),
        ];
    }
}
