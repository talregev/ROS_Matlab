%% Load a bag, build a TF tree using it, and see what frames exist

Root = fileparts(mfilename('fullpath'));
path = [Root filesep 'example.bag'];
bag = ros.Bag.load(path);
tree = ros.TFTree(bag);

tree.allFrames()

%% Figure out where turtle1 was in the world frame throughout the experiment
times = linspace(tree.time_begin + 1, tree.time_end - 1);
world_frame = 'world';
turtle1_frame = 'turtle1';
use_2d = true;
turtle1_xyz = tree.lookup(world_frame, turtle1_frame, times, use_2d);

plot(turtle1_xyz(1, :), turtle1_xyz(2, :), '-');

%% To get full 3D transforms, omit the last argument to lookup()
turtle1_3dpose = tree.lookup(world_frame, turtle1_frame, times)

%% Learn more
doc ros.TFTree

clear rosbag_wrapper;
clear ros.Bag;
clear all