# Hybrid_BORON_Lightweight_Cipher
• Proposed a hybrid BORON cipher by replacing its original key schedule with those from PRESENT and RECTANGLE  using Verilog HDL.  
• Integrating the PRESENT key schedule reduces area by 20.7%, and power consumption by 8.3%, while integrating  the RECTANGLE key schedule reduces area by 10.5% and power consumption by 3.2%.


The project presents the implementation and optimization of the Hybrid BORON lightweight block cipher, specifically designed for IoT and embedded applications where low power, small area, and strong security are critical. BORON operates on 64-bit data blocks and supports 80-bit and 128-bit keys, achieving compact hardware implementations with only 1939 gate equivalents (for 128-bit keys). It uses a Substitution-Permutation Network (SPN) structure over 25 rounds, featuring an S-box-based nonlinear layer, a block shuffle, round permutation, and XOR operations to enhance diffusion and resilience against linear and differential cryptanalysis.

A notable aspect of the work is the hybrid modification of BORON's original key schedule by integrating key schedule modules from PRESENT and RECTANGLE ciphers. The hybrid models were tested using Quartus Prime, ModelSim, and Synopsys Design Compiler tools to measure area, power consumption, and gate count. Simulation results showed that the BORON with PRESENT key schedule achieved the best optimization, reducing the area to 29,231.28 µm², the power to 8.4181 mW, and gate equivalents to 10,511 GEs (compared to the original 36,890.33 µm², 9.1849 mW, and 13,266 GEs).

The encryption process includes add-round-key, 4-bit S-box substitution, block shuffling, round-based circular shifts, and XOR operations, while the key schedule involves left shifts, S-box transformations, and XOR with round constants to generate secure subkeys. Decryption was also successfully performed, validating the correctness of the hybrid design.

Compared to other lightweight ciphers like PRESENT, RECTANGLE, LED, and SIMON, BORON offers higher throughput, lower energy per bit, and better area and power efficiency. Additionally, it outperforms other designs in terms of hardware efficiency and robustness against attacks. The paper concludes that BORON, especially in its hybrid forms, is highly suitable for resource-constrained IoT devices, offering a strong balance between security, area efficiency, and low power consumption.

