function outputArray = polygonAddition(polygonArray,id,counter)
%POLYGONADDITION This function takes the already existing polygon array and
%  the ID from the new polygon to be concatenated, manipulates them and
%  returns the new array.
%
%  Input  :
%     polygonArray : The initial polygon array to be concatenated.
%     id           : The ID of the polygon to be be concatenated to the
%                    initial one.
%     counter      : The ID of the new polygon (used later to identify each
%                    building or foliage polygon).
%
%  Output :
%     outputArray  : The concatenated polygon array.
%
% Copyright (c) 2018-2019, Ioannis Mavromatis
% email: ioan.mavromatis@bristol.ac.uk

    shape = cell2mat(traci.polygon.getShape(id));
    if ~isempty(shape) && (shape(1) ~= shape(end-1) || shape(2) ~= shape(end))
        shape((end-1):end) = shape(1:2);
    end
    shape = reshape(shape,[2, length(shape)/2])';
    shape = [ shape(:,2) shape(:,1) ]; % reshape array to align with the OSM map format
    [sizeShape,~] = size(shape);
    outputArray = [ polygonArray ; repmat(counter,[sizeShape,1]) shape ];
end