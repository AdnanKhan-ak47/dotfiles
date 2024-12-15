local all_snippets = s("snips", fmt([[
/* 
 code 
*/ 
]], {}))

local cpcode = s("code",
  fmt([[

#ifdef ONPC
  #define _GLICBCXX_DEBUG
#endif

#include <bits/stdc++.h>
#include <stdio.h>
using namespace std;
#define ll long long
#define endl "\n"
#define vi vector<int>
#define vvi vector<vector<int>>
#define pi pair<int,int>
#define rep(i,a,b) for(int i=a;i<b;i++)
#define f(i,a,b) for(int i=a;i<=b;i++)
#define fr(i,a,b) for(int i=a;i>=b;i--)
#define all(v)  v.begin(),v.end()
#define rall(v) v.rbegin(),v.rend()
#define pb   push_back
#define sz(x) ((int)(x).size())
#define watch(x) cout << (#x) << " is " << (x) << endl

const int N = 1e6+10;
const int M = 1e9+7;

mt19937 rnd(chrono::steady_clock::now().time_since_epoch().count());

void solve(){{
  {}
}}

int32_t main(){{
	ios_base::sync_with_stdio(false); cin.tie(NULL);
	#ifndef ONLINE_JUDGE
	freopen("input.txt", "r", stdin);
	freopen("error.txt", "w", stderr);
	freopen("output.txt", "w", stdout);
	#endif


	int t;cin>>t;
	while(t--){{
    solve();

    #ifdef ONPC
      cout<<"__________________________"<<endl;
    #endif

  }}

  #ifdef ONPC
	  cerr << "time taken : " << (float)clock() / CLOCKS_PER_SEC << " secs" << endl;
  #endif
	return 0;
}}

]], {i(1)})
)

return {
	s("ctrig", t("also loaded!!")),
  s("shit", t("SHit Happens all the time!!")),
  cpcode,
  all_snippets
  },{
    
	s("autotrig", t("autotriggered, if enabled"))

  }
