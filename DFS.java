
import java.util.*;

public class DFS {
	
	

	public static void main(String [ ] args)
	{
	
	   ArrayList<HashMap<Integer, Integer>> adjList = new ArrayList<>();
	   for(int i=0; i< 5; i++){
		   adjList.add(new HashMap<Integer, Integer>());
	   }
	   
	   adjList.get(0).put((int) 'B'-65, 5);
	   adjList.get(1).put((int) 'C' -65, 4);
	   adjList.get(2).put((int) 'D' -65, 8);
	   adjList.get(3).put((int) 'C' -65, 8);
	   adjList.get(3).put((int) 'E' -65, 6);
	   adjList.get(0).put((int) 'D' -65, 5);
	   adjList.get(2).put((int) 'E' -65, 2);
	   adjList.get(4).put((int) 'B' -65, 3);
	   adjList.get(0).put((int) 'E' -65, 7);
	   Queue<Integer> r = new LinkedList<>();
	   r.addAll(Arrays.asList((int) 'A' - 65, (int) 'E'-65, (int) 'D' -65));

	//   System.out.println(distRoute(adjList,r ));
	  // System.out.println(dfs(adjList, (int)'C' -65, (int)'C' -65, 3, 0));
	  // System.out.println(dfs2(adjList, (int)'A' -65, (int)'C' -65, 4, 0));
	   System.out.println("dfs3");
	   System.out.println(dfs3(adjList, (int)'C' -65, (int)'C' -65, 30, 0));
	   
	  // djkstras(adjList, (int)'A' -65);
	 //  System.out.println(djkstras(adjList, (int)'B' -65)[1]);

	   
	}


	//find the distance of a given route using bfs
	public static int distRoute(ArrayList<HashMap<Integer, Integer>> g, Queue<Integer> r){
		
		int distance = 0;
		int u = r.poll();
		while(!r.isEmpty()){
			//get adjacent nodes in graph
			HashMap<Integer, Integer> map = g.get(u);
			boolean found = false;
			for(Map.Entry<Integer, Integer> entry: map.entrySet()){
				
				int v = entry.getKey();
				int w = entry.getValue();
				//check if node is the next in the route
				if(v == r.element()){
					found = true;
					distance += w;
					break;
				}
				
			}
			if(!found){
				//no such route
				return -1;
			}
			found = false;
			u = r.poll();
			
		}
		
	
		return distance;
	}
	
	
	//find a route from a city back to itself with a maximum number of stops
	public static int dfs(ArrayList<HashMap<Integer, Integer>> g, int s, int u, int maxDepth, int currDepth){
		if (currDepth > maxDepth) {
				return 0;
			
		}
		else{
			HashMap<Integer, Integer> map = g.get(u);
			int numRoutes = 0;
			if (u == s && currDepth > 0){
				//found route
				numRoutes += 1;
				return numRoutes;
			}
			
			for(Map.Entry<Integer, Integer> entry: map.entrySet()){
				int v = entry.getKey();
				
				numRoutes += dfs(g, s, v, maxDepth,currDepth+1);
				
				
			}
			return numRoutes;
		}
	}
	
	//find the number of routes between 2 towns with exactly some number of stops 
	
	public static int dfs2(ArrayList<HashMap<Integer, Integer>> g, int s, int f, int maxDepth, int currDepth){
		if (currDepth > maxDepth) {
				return 0;
			
		}
		else{
			HashMap<Integer, Integer> map = g.get(s);
			int numRoutes = 0;
			if (f == s && currDepth == maxDepth){
				//found route
				numRoutes += 1;
				return numRoutes;
			}
			
			for(Map.Entry<Integer, Integer> entry: map.entrySet()){
				int v = entry.getKey();
				
				numRoutes += dfs2(g, v, f, maxDepth,currDepth+1);
				
				
			}
			return numRoutes;
		}
	}
	
	//find the shortest distance from a node to every other node
	public static int[] djkstras(ArrayList<HashMap<Integer, Integer>> g, int s){
		int[] distance = new int[8];
		boolean[] inTree = new boolean[8];
		
		for (int i = 0 ;i < 8; i++){
			distance[i] = Integer.MAX_VALUE;
		}
		int u = s;
		distance[u] = 0;
		while (!inTree[u]){
			inTree[u] = true;
			HashMap<Integer, Integer> map = g.get(u);
			
			for(Map.Entry<Integer, Integer> entry: map.entrySet()){
				int v = entry.getKey();
				int w = entry.getValue();
				//check if found a lesser distance or found the starting node 
				if (distance[v] > (distance[u] + w) || (v == s && distance[s] == 0)){
					distance[v] = distance[u] + w;
				}
				
				
			}
			
			int dist = Integer.MAX_VALUE;
			//find the node with the least distance that is not yet in the tree
			for(int i = 0; i < 8; i++){
				if (!inTree[i] && distance[i] < dist){
					dist = distance[i];
					u = i;
				}
			}
		}
		return distance;
		
		
		
	}
	
	public static int dfs3(ArrayList<HashMap<Integer, Integer>> g, int s, int u, int maxDist, int currDist){
		if (currDist >= maxDist) {
				return 0;
			
		}
		else{
			HashMap<Integer, Integer> map = g.get(u);
			int numRoutes = 0;
			if (u == s && currDist > 0){
				//found route
				numRoutes += 1;
				//return numRoutes;
			}
			
			for(Map.Entry<Integer, Integer> entry: map.entrySet()){
				int v = entry.getKey();
				int w = entry.getValue();
				numRoutes += dfs3(g, s, v, maxDist,currDist + w);
				
				
			}
			return numRoutes;
		}
	}
	
}
