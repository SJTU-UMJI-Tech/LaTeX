int main()
{ // The scope "main" of function main
  int a = 1; // int a is defined in scope "main"
  for (int i = 0; i < 10; i++)
  { // The scope "for" of the for loop
    int b = i; // int b and i are both defined in scope "for"
    a += b; // int a can be visited here!
  }
  { // The scope "other", we can directly define a scope like this
    int c; // int c is defined in scope "other"
    c = a; // int a can be visited here!
  }
  a -= c // error: c is not in scope "main", can't be visited!
}
