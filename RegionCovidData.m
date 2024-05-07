classdef RegionCovidData
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Name (1,:) string
        CasesCum (1,:) double
        DeathsCum (1,:) double
        SubRegions 
        ParentRegion 
        DatabaseIndex
    end

    methods
        function obj = RegionCovidData(inputData,index)
            % Construct an instance of this class
            % Assumes entire database row is entered
            obj.DatabaseIndex = index;

            if isempty(inputData{2}) 
                obj.Name = inputData{1}; % First colum has country
                obj.ParentRegion = "World";
            else
                obj.Name = inputData{2}; % Second column has state
                obj.ParentRegion = inputData{1};
            end
            dataLength = length(inputData(3:end));
            obj.CasesCum = zeros(1,dataLength);
            obj.DeathsCum = zeros(1,dataLength);

            for ii = 1:dataLength
                obj.CasesCum(ii) = inputData{2+ii}(1);
                obj.DeathsCum(ii) = inputData{2+ii}(2);
            end

            % Add somthing to properly link Subregion objects
        end
        function obj = setSubRegions(obj,num)
            obj.SubRegions = num;
        end
    end
end