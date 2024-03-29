## Bash Style Conventions

The most important thing re coding style (as with any contribution) is to
follow the style conventions in place for the existing code.

Here are some basics:

* Use spaces for indentation.
  No tabs please.
* Use 4 space indent.
* Keep lines under 80 chars if possible.
* Always use `[[ ... ]]`, not `[ ... ]` form.
* Don't use `-n`.
* Don't quote things that don't need quotes.
  * Unless it really adds to readability.
* If script is long, break into functions and use a `main` function at top.
* Function names should be `foo-bar` not `foo_bar`.
* Define functions `foo-bar() ( ... )`, not `function foo-bar ( ... )`.


## Testing

* Run `make test`.
