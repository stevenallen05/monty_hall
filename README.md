# A Ruby script to prove The Monty Hall problem

[A full overview of the Monty Hall problem can be found here, complete with the mathematical concepts behind why this works.](https://www.montyhallproblem.com/
)

## TL;DR:

You're on a game show, and there's three doors. One door has a brand new car, the other two doors have goats. The host, Monty, tells you to pick a door. You pick Door #1. Monty opens Door #2, which has a goat. You now have to choose - stay with Door #1, or switch to Door #3.

Do you stay, or switch?

## The solution:

The answer is unintuitive. You always switch. You double your chances of switching. I find it's easier to think about it in terms of the odds of LOSING. The only way to lose by switching is if you picked the car on your first go (33% chance). Whereas if you stay, you have to have picked the car on your first go (66% chance).

## Programatic proof

By default, this script runs through 1,000,000 iterations of the Game Show for each strategy: always stay with the first choice, and always switch. It spits out the total number wins per strategy. No matter how many times you run it, `Always stay` will win approximately 33% of the time (+/- some random variance), and `Always switch` will win twice as often.

Download & run this ruby script, and run `bundle install` to ensure you've got the dependnecies. 

Then run `bundle exec ruby monty.rb`.

### Results

```bash
$ bundle exec ruby monty.rb
Always stay: |===========================================================================================================================================================================|
Record: 33.247% (332470/1000000)
Always switch: |=========================================================================================================================================================================|
Record: 66.662% (666620/1000000)
```
