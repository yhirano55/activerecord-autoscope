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

| Type | Scope method | Description | Notes |
| ---- | --------- | ----------- | ----- |
| All | `#{col}_eq(val)` | equal | |
| All | `#{col}_not_eq(val)` | not equal | |
| All | `#{col}_is(val)` | equal | |
| All | `#{col}_is_not(val)` | not equal | |
| All | `#{col}_null` | is null | |
| All | `#{col}_not_null` | is not null | |
| All | `#{col}_present` | not null and not empty | SQL: `col IS NOT NULL AND col != ''` |
| All | `#{col}_blank` | null or empty | SQL: `col IS NULL OR col = ''` |
| All | `#{col}_asc` | ascending order | |
| All | `#{col}_desc` | descending order | |
| `:integer` | `#{col}_gt(val)` | greater than | |
| `:integer` | `#{col}_gteq(val)` | greater than or equal | |
| `:integer` | `#{col}_lt(val)` | less than | |
| `:integer` | `#{col}_lteq(val)` | less than or equal | |
| `:string`, `:text` | `#{col}_start(val)` | starts with | SQL: `col LIKE 'value%'` |
| `:string`, `:text` | `#{col}_not_start(val)` | does not start with | |
| `:string`, `:text` | `#{col}_end(val)` | ends with | SQL: `col LIKE '%value'` |
| `:string`, `:text` | `#{col}_not_end(val)` | does not end with | |
| `:string`, `:text` | `#{col}_cont(val)` | contains | SQL: `col LIKE '%value%'` |
| `:string`, `:text` | `#{col}_not_cont(val)` | does not contain | |
| `:date`, `:datetime` | `#{col}_after(val)` | after | |
| `:date`, `:datetime` | `#{col}_on_or_after(val)` | on or after | |
| `:date`, `:datetime` | `#{col}_before(val)` | before | |
| `:date`, `:datetime` | `#{col}_on_or_before(val)` | on or before | |
| `:date`, `:datetime` | `#{col}_between(range)` | between | |
| `:boolean` | `#{col}` | true | SQL: `col IS true` |
| `:boolean` | `not_#{col}` | false | |

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
