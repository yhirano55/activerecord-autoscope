# ActiveRecord::AutoScope

This gem automatically defines **scope methods which we often implement**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-autoscope'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-autoscope

## Usage

This gem automatically defines these scope methods **without configuration**

These APIs are similar as [Ransack](https://github.com/activerecord-hackery/ransack/)'s one, but these scope methods are simple implementations.

Please check its [implementation](https://github.com/yhirano55/activerecord-autoscope/blob/master/lib/activerecord/auto_scope/scope_methods.rb) if you're interested in.

| Type | Predicate | Description | Notes |
| ---- | --------- | ----------- | ----- |
| all | `*_eq` | equal | |
| all | `*_not_eq` | not equal | |
| all | `*_is` | equal | |
| all | `*_is_not` | not equal | |
| all | `*_null` | is null | |
| all | `*_not_null` | is not null | |
| all | `*_present` | not null and not empty | |
| all | `*_blank` | null or empty | |
| `:integer` | `*_gt` | greater than | |
| `:integer` | `*_gteq` | greater than or equal | |
| `:integer` | `*_lt` | less than | |
| `:integer` | `*_lteq` | less than or equal | |
| `:string`, `:text` | `*_start` | starts with | SQL: `col LIKE 'value%'` |
| `:string`, `:text` | `*_not_start` | does not start with | |
| `:string`, `:text` | `*_end` | ends with | SQL: `col LIKE '%value'` |
| `:string`, `:text` | `*_not_end` | does not end with | |
| `:string`, `:text` | `*_cont` | contains | SQL: `col LIKE '%value%'` |
| `:string`, `:text` | `*_not_cont` | does not contain | |
| `:date`, `:datetime` | `*_after` | after | |
| `:date`, `:datetime` | `*_on_or_after` | on or after | |
| `:date`, `:datetime` | `*_before` | before | |
| `:date`, `:datetime` | `*_on_or_before` | on or before | |
| `:date`, `:datetime` | `*_between` | between | |
| `:boolean` | `*` | true | SQL: `col IS true` |
| `:boolean` | `not_*` | false | |

### Manually settings

If you want to define these scope methods manually, you have to add this initializer file:

```ruby
# config/initializers/activerecord_autoscope.rb
ActiveRecord::AutoScope.config.auto_define_scopes = false
```

Then you have to enable inside each models:

```ruby
class User < ApplicationRecord
  enable_auto_scopes!
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
