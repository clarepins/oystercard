1. Described Oystercard class
  Result - error: uninitialized constant Oystercard
  line 3 oystercard_spec.rb

2. Defined Oystercard class
  Result - passed tests

3. Expected an Oystercard instance to have a default balance of 0
  Result - error: NoMethodError: undefined method `balance''
  in line 7

4. Defined the initialize method to have a balance of 0
  Result - Passed tests

5. Feature tested top_up method
  Result - error: NoMethodError (undefined method `top_up')

6. Wrote top_up NoMethod
  Result - passed tests

7. Feature testsed and wrote rspec test for balance not exceeding £90.
  Result - error: expect ... but nothing was raised

8. Added a guard loop to top_up to prevent balance exceeding the maximum
  Result - passed tests

9. Unit tested initializing with 70 and topping up 30
  Result - ArgumentError: wrong number of arguments (given 1, expected 0)

10. Gave initialize method argument balance = 0
  Result - passed tests

11. Feature tested deduct method
  Result - NoMethodError (undefined method 'deduct')

12. Unit test for deduct method
  Result - error: undefined method 'deduct'

13. Coded deduct NoMethod
  Result - Passed

14. Did feature and unit tests for in_journey?, touch_in and touch_out
  Got errors for undefined methods

15. Added instance variable in_journey
  Result - Passed

16. Feature tested touch_in with balance below minimum, expected error
  Result - no error, need to unit test

17. Wrote code to raise error if balance < MIN_FARE on touch in
  Result - Passed

18. Feature tested and wrote unit test to reduce @balance by MIN_FARE when touch_out
  Result - error:     Failure/Error: expect { @oystercard.touch_out }.to change{@oystercard.balance}.by(- Oystercard::MIN_FARE)
       expected `@oystercard.balance` to have changed by -1, but was changed by 0

19. Changed touch_out method to change balance by - MIN_FARE
  Result - Passed

20. 
