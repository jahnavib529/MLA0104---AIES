BEGIN

    DISPLAY "AUTOMOBILE FAULT DIAGNOSIS SYSTEM"

    DEFINE symptoms:
        engine_noise
        starting_problem
        warning_indicator
        abnormal_vibration
        reduced_mileage
        dim_headlights
        engine_misfire
        low_oil_level
        high_temperature
        vehicle_pulls_sideways
        steering_wheel_shaking
        vibration_during_braking
        poor_acceleration

    DEFINE production rules:

        IF starting_problem AND dim_headlights
        THEN fault = weak_battery

        IF starting_problem AND engine_misfire
        THEN fault = faulty_spark_plugs

        IF starting_problem AND reduced_mileage
        THEN fault = clogged_fuel_filter

        IF starting_problem AND warning_indicator AND dim_headlights
        THEN fault = alternator_failure

        IF engine_noise AND low_oil_level
        THEN fault = engine_oil_problem

        IF engine_noise AND abnormal_vibration
        THEN fault = worn_engine_bearing

        IF engine_noise AND high_temperature AND warning_indicator
        THEN fault = engine_overheating

        IF abnormal_vibration AND vehicle_pulls_sideways
        THEN fault = wheel_alignment_problem

        IF abnormal_vibration AND steering_wheel_shaking
        THEN fault = tire_imbalance

        IF abnormal_vibration AND vibration_during_braking
        THEN fault = brake_problem

        IF reduced_mileage AND engine_misfire
        THEN fault = faulty_fuel_injector

        IF reduced_mileage AND warning_indicator
        THEN fault = oxygen_sensor_fault

        IF reduced_mileage AND warning_indicator AND poor_acceleration
        THEN fault = catalytic_converter_problem

        IF starting_problem AND engine_misfire AND warning_indicator
        THEN fault = ignition_system_fault


    INPUT observed symptoms


    ------------------------------------------------
    FORWARD CHAINING
    ------------------------------------------------

    SET known_facts = observed symptoms
    SET faults = empty list

    REPEAT

        SET new_fault_found = FALSE

        FOR each rule in knowledge base

            IF all conditions of rule
               are present in known_facts THEN

                IF rule's conclusion is not in known_facts THEN

                    ADD rule's conclusion to known_facts
                    ADD conclusion to faults
                    SET new_fault_found = TRUE

                END IF

            END IF

        END FOR

    UNTIL new_fault_found = FALSE


    ------------------------------------------------
    DISPLAY FORWARD CHAINING RESULTS
    ------------------------------------------------

    IF faults is empty THEN
        DISPLAY "No probable fault found"
    ELSE
        DISPLAY "Probable faults:"
        DISPLAY faults
    END IF


    ------------------------------------------------
    BACKWARD CHAINING
    ------------------------------------------------

    FOR each possible fault

        SET goal = possible fault

        FIND rule whose conclusion is goal

        IF rule exists THEN

            CHECK every condition required by the rule

            IF every required condition
               is present in observed symptoms THEN

                DISPLAY goal, "is supported"

            ELSE

                DISPLAY goal, "cannot be proven"

            END IF

        END IF

    END FOR


    ------------------------------------------------
    FINAL RESULT
    ------------------------------------------------

    DISPLAY "Diagnosis completed"
    DISPLAY "Check the identified fault with a qualified mechanic"

END
