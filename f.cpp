#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;
class union_find{
	map<char,char>parent;
public:
	char root(char a){return parent[a]==a?a:(parent[a]=root(parent[a]));}
	union_find(){
		for(char i='a';i<='z';i++)parent[i]=i;
	}
	int same(int a,int b){return root(a)==root(b);}
	int unite(int a,int b){
		int x=root(a),y=root(b);
		parent[x]=y;
		return 1;
	}
	map<char,string> size(){
		map<char,string>s;
		for(char i='a';i<='z';i++)s[root(i)]+=i;
		return s;
	}
};
struct less_size{
	bool operator()(const string &l, const string &r) const{return l.size()<r.size();}
};
int main(){
	int T,N,i;
	string s;
	cin>>T;
	for(;T--;){
		union_find uf;
		for(cin>>N;N--;){
			cin>>s;
			for(i=1;i<s.size();i++)uf.unite(s[0],s[i]);
		}
		map<char,string>m=uf.size();
		vector<int>w;
		map<int,vector<string> >z;
		for(map<char,string>::iterator it=m.begin();it!=m.end();it++){
			w.push_back(it->second.size());
			z[it->second.size()].push_back(it->second);
		}
		sort(w.begin(),w.end());
		bool f=false;
		do{
			int a=0,b=0,c=0;
			for(i=0;a<10;i++)a+=w[i];
			if(a>10)continue;
			for(;b<9;i++)b+=w[i];
			if(b>9)continue;
			for(;c<7;i++)c+=w[i];
			if(c>7)continue;
			f=true;
			break;
		}while(next_permutation(w.begin(),w.end())); //this next_permutation doesn't yield dups!
		if(f){
			int a=0,b=0,c=0;
			for(i=0;a<10;i++){
				a+=w[i];
				cout<<z[w[i]][0];
				z[w[i]].erase(z[w[i]].begin());
			}
			cout<<' ';
			for(;b<9;i++){
				b+=w[i];
				cout<<z[w[i]][0];
				z[w[i]].erase(z[w[i]].begin());
			}
			cout<<' ';
			for(;c<7;i++){
				c+=w[i];
				cout<<z[w[i]][0];
				z[w[i]].erase(z[w[i]].begin());
			}
			cout<<endl;
		}else{
			cout<<"IMPOSSIBLE"<<endl;
		}
	}
}