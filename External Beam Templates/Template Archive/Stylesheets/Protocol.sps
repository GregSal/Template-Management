<?xml version="1.0" encoding="UTF-8"?>
<structure version="2" schemafile="C:\Projects\VA75\PreVFC\XMLTemplate\Schemas\ClinicalProtocol.xsd" workingxmlfile="Protocol.xml" templatexmlfile="">
	<nspair prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<template>
		<properties title="Clinical Protocol"/>
		<match overwrittenxslmatch="/"/>
		<children>
			<newline/>
			<table>
				<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
				<children>
					<tablebody>
						<children>
							<tablerow>
								<children>
									<tablecol>
										<properties align="center" valign="middle" width="707"/>
										<children>
											<text fixtext="Clinical Protocol"/>
										</children>
									</tablecol>
									<tablecol>
										<children>
											<image>
												<properties border="0"/>
												<imagesource>
													<fixtext value="Logo.bmp"/>
												</imagesource>
											</image>
										</children>
									</tablecol>
								</children>
							</tablerow>
						</children>
					</tablebody>
				</children>
			</table>
			<line>
				<properties color="black" size="1"/>
			</line>
			<newline/>
			<paragraph paragraphtag="p">
				<children>
					<template>
						<match match="Protocol"/>
						<children>
							<newline/>
							<template>
								<match match="Preview"/>
								<children>
									<newline/>
									<table>
										<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
										<children>
											<tablebody>
												<children>
													<tablerow>
														<children>
															<tablecol>
																<properties width="129"/>
																<children>
																	<text fixtext="Protocol id:"/>
																</children>
															</tablecol>
															<tablecol>
																<properties width="567"/>
																<children>
																	<template>
																		<match match="@ID"/>
																		<children>
																			<xpath allchildren="1"/>
																		</children>
																	</template>
																	<text fixtext=" ["/>
																	<template>
																		<match match="@ApprovalStatus"/>
																		<children>
																			<xpath allchildren="1"/>
																		</children>
																	</template>
																	<text fixtext="]"/>
																</children>
															</tablecol>
														</children>
													</tablerow>
													<tablerow>
														<children>
															<tablecol>
																<properties width="129"/>
																<children>
																	<text fixtext="Description:"/>
																</children>
															</tablecol>
															<tablecol>
																<properties width="567"/>
																<children>
																	<template>
																		<match match="@Description"/>
																		<children>
																			<xpath allchildren="1"/>
																		</children>
																	</template>
																</children>
															</tablecol>
														</children>
													</tablerow>
													<tablerow>
														<children>
															<tablecol>
																<properties width="129"/>
																<children>
																	<text fixtext="Treatment site:"/>
																</children>
															</tablecol>
															<tablecol>
																<properties width="567"/>
																<children>
																	<template>
																		<match match="@TreatmentSite"/>
																		<children>
																			<xpath allchildren="1"/>
																		</children>
																	</template>
																</children>
															</tablecol>
														</children>
													</tablerow>
													<tablerow>
														<children>
															<tablecol>
																<properties width="129"/>
																<children>
																	<text fixtext="Fixed SSD"/>
																</children>
															</tablecol>
															<tablecol>
																<properties width="567"/>
																<children>
																	<template>
																		<match match="@Mode"/>
																		<children>
																			<xpath allchildren="1"/>
																		</children>
																	</template>
																</children>
															</tablecol>
														</children>
													</tablerow>
													<tablerow>
														<children>
															<tablecol>
																<properties width="129"/>
																<children>
																	<text fixtext="Treatment style:"/>
																</children>
															</tablecol>
															<tablecol>
																<properties width="567"/>
																<children>
																	<template>
																		<match match="@TreatmentStyle"/>
																		<children>
																			<xpath allchildren="1"/>
																		</children>
																	</template>
																</children>
															</tablecol>
														</children>
													</tablerow>
												</children>
											</tablebody>
										</children>
									</table>
								</children>
							</template>
							<newline/>
							<paragraph paragraphtag="div">
								<children>
									<newline/>
								</children>
							</paragraph>
							<text fixtext="Structures"/>
							<paragraph paragraphtag="div">
								<children>
									<newline/>
									<template>
										<match match="StructureTemplate"/>
										<children>
											<template>
												<match match="Structures"/>
												<children>
													<template>
														<match match="Structure"/>
														<children>
															<table dynamic="1">
																<properties border="0" cellpadding="1" cellspacing="1"/>
																<children>
																	<tableheader>
																		<children>
																			<tablerow>
																				<properties align="center" valign="middle"/>
																				<children>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="I"/>
																							<text fixtext="D"/>
																							<autovalue>
																								<editorproperties editable="0"/>
																								<autocalc>
																									<xpath value="string()"/>
																								</autocalc>
																							</autovalue>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="100"/>
																						<children>
																							<text fixtext="Name"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="80"/>
																						<children>
																							<text fixtext="Identification"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="Type index"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="150"/>
																						<children>
																							<text fixtext="Color"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="CT Low"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="CT High"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="DVH line style"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="DVH line color"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="DVH line width"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="EUD alpha"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="69"/>
																						<children>
																							<text fixtext="TCP alpha"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="TCP Beta"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<text fixtext="TCP gamma"/>
																						</children>
																					</tablecol>
																				</children>
																			</tablerow>
																		</children>
																	</tableheader>
																	<tablebody>
																		<children>
																			<tablerow>
																				<properties align="center" valign="middle"/>
																				<children>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="@ID"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="100"/>
																						<children>
																							<template>
																								<match match="@Name"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="80"/>
																						<children>
																							<template>
																								<match match="Identification"/>
																								<children>
																									<template>
																										<match match="VolumeID"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																									<text fixtext="&quot;"/>
																									<template>
																										<match match="VolumeCode"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																									<text fixtext=" "/>
																									<newline/>
																									<template>
																										<match match="VolumeType"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																									<newline/>
																									<template>
																										<match match="VolumeCodeTable"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																									<newline/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="TypeIndex"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="150"/>
																						<children>
																							<template>
																								<match match="ColorAndStyle"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="SearchCTLow"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="SearchCTHigh"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="DVHLineStyle"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="DVHLineColor"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="DVHLineWidth"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="EUDAlpha"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="69"/>
																						<children>
																							<template>
																								<match match="TCPAlpha"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="TCPBeta"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<properties width="70"/>
																						<children>
																							<template>
																								<match match="TCPGamma"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																				</children>
																			</tablerow>
																		</children>
																	</tablebody>
																</children>
															</table>
														</children>
													</template>
												</children>
											</template>
										</children>
									</template>
									<template>
										<match match="Phases"/>
										<children>
											<newline/>
											<text fixtext="Phases"/>
											<newline/>
											<newline/>
											<template>
												<match match="Phase"/>
												<children>
													<newline/>
													<table>
														<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
														<children>
															<tablebody>
																<children>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties width="129"/>
																				<children>
																					<text fixtext="Phase Id:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties width="567"/>
																				<children>
																					<template>
																						<match match="@ID"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties width="129"/>
																				<children>
																					<text fixtext="Phase Mode:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties width="567"/>
																				<children>
																					<template>
																						<match match="Mode"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties width="129"/>
																				<children>
																					<text fixtext="Fraction Count:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties width="567"/>
																				<children>
																					<template>
																						<match match="FractionCount"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties width="129"/>
																				<children>
																					<text fixtext="Fraction Per Week:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties width="567"/>
																				<children>
																					<template>
																						<match match="FractionsPerWeek"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties height="22" width="129"/>
																				<children>
																					<text fixtext="Fractions Per Day:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties height="22" width="567"/>
																				<children>
																					<template>
																						<match match="FractionsPerDay"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties height="22" width="129"/>
																				<children>
																					<text fixtext="Treatment Unit:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties height="22" width="567"/>
																				<children>
																					<template>
																						<match match="TreatmentUnit"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties height="22" width="129"/>
																				<children>
																					<text fixtext="Treatment Style:"/>
																				</children>
																			</tablecol>
																			<tablecol>
																				<properties height="22" width="567"/>
																				<children>
																					<template>
																						<match match="TreatmentStyle"/>
																						<children>
																							<xpath allchildren="1"/>
																						</children>
																					</template>
																				</children>
																			</tablecol>
																		</children>
																	</tablerow>
																	<tablerow>
																		<children>
																			<tablecol>
																				<properties width="129"/>
																			</tablecol>
																			<tablecol>
																				<properties width="567"/>
																			</tablecol>
																		</children>
																	</tablerow>
																</children>
															</tablebody>
														</children>
													</table>
													<newline/>
													<text fixtext="Prescription"/>
													<newline/>
													<newline/>
													<template>
														<match match="Prescription"/>
														<children>
															<template>
																<match match="Item"/>
																<children>
																	<table dynamic="1">
																		<properties border="0" cellpadding="1" cellspacing="1"/>
																		<children>
																			<tableheader>
																				<children>
																					<tablerow>
																						<children>
																							<tablecol>
																								<children>
																									<text fixtext="ID"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<text fixtext="Primary"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<text fixtext="Type"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<text fixtext="Operator"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<text fixtext="Volume"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<text fixtext="Dose"/>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																				</children>
																			</tableheader>
																			<tablebody>
																				<children>
																					<tablerow>
																						<children>
																							<tablecol>
																								<children>
																									<template>
																										<match match="@ID"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<template>
																										<match match="@Primary"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<template>
																										<match match="Type"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<template>
																										<match match="Operator"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<template>
																										<match match="Volume"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																							<tablecol>
																								<children>
																									<template>
																										<match match="FractionDose"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																				</children>
																			</tablebody>
																		</children>
																	</table>
																</children>
															</template>
														</children>
													</template>
													<newline/>
													<text fixtext="Fields"/>
													<newline/>
													<template>
														<match match="PlanGeometry"/>
														<children>
															<template>
																<match match="Fields"/>
																<children>
																	<newline/>
																	<template>
																		<match match="Field"/>
																		<children>
																			<newline/>
																			<table>
																				<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
																				<children>
																					<tablebody>
																						<children>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="179"/>
																										<children>
																											<text fixtext="Field id:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties width="850"/>
																										<children>
																											<template>
																												<match match="@ID"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																										<children>
																											<text fixtext="Using MLC"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" width="567"/>
																										<children>
																											<template>
																												<match match="@UsingMLC"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="179"/>
																									</tablecol>
																									<tablecol>
																										<properties width="850"/>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="179"/>
																										<children>
																											<text fixtext=":Mode:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties width="850"/>
																										<children>
																											<template>
																												<match match="@FixedSSD"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																										<children>
																											<text fixtext="Using Compensator:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" width="567"/>
																										<children>
																											<template>
																												<match match="@UsingCompensator"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="179"/>
																									</tablecol>
																									<tablecol>
																										<properties width="850"/>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="179"/>
																									</tablecol>
																									<tablecol>
																										<properties width="850"/>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="179"/>
																									</tablecol>
																									<tablecol>
																										<properties width="850"/>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="3" width="179"/>
																									</tablecol>
																									<tablecol>
																										<properties height="3" width="850"/>
																									</tablecol>
																									<tablecol>
																										<properties height="3" width="567"/>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="3" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="21" width="179"/>
																										<children>
																											<text fixtext="Treatement Unit:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="21" width="850"/>
																										<children>
																											<template>
																												<match match="TreatmentUnit"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="21" width="567"/>
																										<children>
																											<text fixtext="Technique:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="21" width="567"/>
																										<children>
																											<template>
																												<match match="Technique"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="23" width="179"/>
																										<children>
																											<text fixtext="Energy"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="23" width="850"/>
																										<children>
																											<template>
																												<match match="EnergyMode"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="23" width="567"/>
																										<children>
																											<text fixtext="DRR:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="23" width="567"/>
																										<children>
																											<template>
																												<match match="DRRTemplate"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="21" width="179"/>
																										<children>
																											<text fixtext="Dose Rate:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="21" width="850"/>
																										<children>
																											<template>
																												<match match="DoseRate"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="21" width="567"/>
																										<children>
																											<text fixtext="SFED:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="21" width="567"/>
																										<children>
																											<template>
																												<match match="SFED"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="21" width="179"/>
																										<children>
																											<text fixtext="Gantry Rtn:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="21" width="850"/>
																										<children>
																											<template>
																												<match match="Gantry"/>
																												<children>
																													<template>
																														<match match="Rtn"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="21" width="567"/>
																										<children>
																											<text fixtext="Gantry Stop Rtn:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="21" width="567"/>
																										<children>
																											<template>
																												<match match="Gantry"/>
																												<children>
																													<template>
																														<match match="StopRtn"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="179"/>
																										<children>
																											<text fixtext="Gantry Direction:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="850"/>
																										<children>
																											<template>
																												<match match="Gantry"/>
																												<children>
																													<template>
																														<match match="RtnDirection"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<text fixtext="Table Rtn:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="22" width="567"/>
																										<children>
																											<template>
																												<match match="TableRtn"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="41" width="179"/>
																										<children>
																											<text fixtext="Collimator:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="4" height="41" width="179"/>
																										<children>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Rtn"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<text fixtext=" "/>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Mode"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<text fixtext=" "/>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="X1"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="X2"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Y1"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Y2"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="41" width="179"/>
																										<children>
																											<text fixtext="Tolerance Table:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="850"/>
																										<children>
																											<template>
																												<match match="ToleranceTableID"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="179"/>
																										<children>
																											<text fixtext="Weight:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="335"/>
																										<children>
																											<template>
																												<match match="Weight"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="179"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="41" width="179"/>
																										<children>
																											<text fixtext="Skin Fash Margin:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="850"/>
																										<children>
																											<template>
																												<match match="SkinFlashMargin"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="179"/>
																										<children>
																											<text fixtext="Bolus Thickness:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="335"/>
																										<children>
																											<template>
																												<match match="BolusThickness"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="179"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="41" width="179"/>
																										<children>
																											<text fixtext="Isocenter:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="3" height="41" width="850"/>
																										<children>
																											<template>
																												<match match="Isocenter"/>
																												<children>
																													<text fixtext="["/>
																													<template>
																														<match match="@X"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																													<text fixtext=", "/>
																													<template>
																														<match match="@Y"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																													<text fixtext=", "/>
																													<template>
																														<match match="@Z"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																													<text fixtext="]"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="41" width="179"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="179"/>
																										<children>
																											<text fixtext="Collimator Angle:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="850"/>
																										<children>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Rtn"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<text fixtext="Collimator Mode:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="2" height="22" width="567"/>
																										<children>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Mode"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="42" width="179"/>
																										<children>
																											<text fixtext="Collimator Size"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties colspan="4" height="42" width="850"/>
																										<children>
																											<text fixtext="X1: "/>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="X1"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<text fixtext=" X2:"/>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="X2"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<text fixtext="Y1:"/>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Y1"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																											<text fixtext=" Y2:"/>
																											<template>
																												<match match="Collimator"/>
																												<children>
																													<template>
																														<match match="Y2"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																						</children>
																					</tablebody>
																				</children>
																			</table>
																			<newline/>
																			<newline/>
																			<template>
																				<match match="Blocks"/>
																				<children>
																					<text fixtext="Field Blocks"/>
																					<template>
																						<match match="Block"/>
																						<children>
																							<table dynamic="1">
																								<properties border="0" cellpadding="1" cellspacing="1"/>
																								<children>
																									<tableheader>
																										<children>
																											<tablerow>
																												<properties align="center" valign="middle"/>
																												<children>
																													<tablecol>
																														<children>
																															<text fixtext="ID"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Diverging"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Above Tray"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Type"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Tray"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Material"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="BlockMargin"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Target"/>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tableheader>
																									<tablebody>
																										<children>
																											<tablerow>
																												<children>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@ID"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@DivergingFlag"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@AboveTrayFlag"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Type"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Tray"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="BlockMargin"/>
																																<children>
																																	<template>
																																		<match match="@BEVMarginFlag"/>
																																		<children>
																																			<xpath allchildren="1"/>
																																		</children>
																																	</template>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="BlockMargin"/>
																																<children>
																																	<choice>
																																		<children>
																																			<choiceoption>
																																				<testexpression>
																																					<xpath value="@BEVMarginFlag  = &quot;true&quot;"/>
																																				</testexpression>
																																			</choiceoption>
																																		</children>
																																	</choice>
																																	<template>
																																		<match match="Left"/>
																																		<children>
																																			<xpath allchildren="1"/>
																																		</children>
																																	</template>
																																	<template>
																																		<match match="Right"/>
																																		<children>
																																			<xpath allchildren="1"/>
																																		</children>
																																	</template>
																																	<template>
																																		<match match="Top"/>
																																		<children>
																																			<xpath allchildren="1"/>
																																		</children>
																																	</template>
																																	<template>
																																		<match match="Bottom"/>
																																		<children>
																																			<xpath allchildren="1"/>
																																		</children>
																																	</template>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Target"/>
																																<children>
																																	<newline/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tablebody>
																								</children>
																							</table>
																							<newline/>
																						</children>
																					</template>
																				</children>
																			</template>
																			<newline/>
																			<template>
																				<match match="MLCPlans"/>
																				<children>
																					<text fixtext="Field MLCs"/>
																					<template>
																						<match match="MLCPlan"/>
																						<children>
																							<table dynamic="1">
																								<properties border="0" cellpadding="1" cellspacing="1"/>
																								<children>
																									<tableheader>
																										<children>
																											<tablerow>
																												<properties align="center" valign="middle"/>
																												<children>
																													<tablecol>
																														<children>
																															<text fixtext="ID"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Dynamic"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Model Name"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Segment Count"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="MLC Margin"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Contour Meet Point"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Closed Meet Point"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Target"/>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tableheader>
																									<tablebody>
																										<children>
																											<tablerow>
																												<children>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@ID"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@DynamicFlag"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="ModelName"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="SegmentCount"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="MLCMargin"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="ContourMeetPoint"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="ClosedMeetPoint"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Target"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tablebody>
																								</children>
																							</table>
																						</children>
																					</template>
																				</children>
																			</template>
																			<newline/>
																			<template>
																				<match match="Wedges"/>
																				<children>
																					<text fixtext="Field Wedges"/>
																					<template>
																						<match match="Wedge"/>
																						<children>
																							<table dynamic="1">
																								<properties border="0" cellpadding="1" cellspacing="1"/>
																								<children>
																									<tableheader>
																										<children>
																											<tablerow>
																												<properties align="center" valign="middle"/>
																												<children>
																													<tablecol>
																														<children>
																															<text fixtext="ID"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Slot"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Type"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Thin Edge Jaw"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Angle Deg"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Min ColX"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Max ColX"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Min ColY"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Max ColY"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Moto Weight"/>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tableheader>
																									<tablebody>
																										<children>
																											<tablerow>
																												<children>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@ID"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Slot"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Type"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="ThinEdgeJaw"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="AngleDeg"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="MinCollX"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="MaxCollX"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="MinCollY"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="MaxCollY"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="MotoWeight"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tablebody>
																								</children>
																							</table>
																						</children>
																					</template>
																				</children>
																			</template>
																			<newline/>
																			<template>
																				<match match="Applicators"/>
																				<children>
																					<text fixtext="Field Applicator"/>
																					<template>
																						<match match="Applicator"/>
																						<children>
																							<table dynamic="1">
																								<properties border="0" cellpadding="1" cellspacing="1"/>
																								<children>
																									<tableheader>
																										<children>
																											<tablerow>
																												<properties align="center" valign="middle"/>
																												<children>
																													<tablecol>
																														<children>
																															<text fixtext="ID"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="XSize"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="YSize"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Slot"/>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tableheader>
																									<tablebody>
																										<children>
																											<tablerow>
																												<children>
																													<tablecol>
																														<children>
																															<template>
																																<match match="@ID"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="XSize"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="YSize"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Slot"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tablebody>
																								</children>
																							</table>
																						</children>
																					</template>
																				</children>
																			</template>
																			<newline/>
																		</children>
																	</template>
																	<newline/>
																</children>
															</template>
														</children>
													</template>
													<newline/>
													<newline/>
													<text fixtext="Objectives"/>
													<newline/>
													<newline/>
													<template>
														<match match="ObjectiveTemplate"/>
														<children>
															<template>
																<match match="Helios"/>
																<children>
																	<newline/>
																	<table>
																		<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
																		<children>
																			<tablebody>
																				<children>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																								<children>
																									<text fixtext="Smoothing X:"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																								<children>
																									<template>
																										<match match="DefaultSmoothingY"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																								<children>
																									<text fixtext="Smoothing Y:"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																								<children>
																									<template>
																										<match match="DefaultSmoothingX"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																								<children>
																									<text fixtext="Minimize Dose: "/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																								<children>
																									<template>
																										<match match="DefaultMinimizeDose"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																								<children>
																									<text fixtext="Optimization Type: "/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																								<children>
																									<template>
																										<match match="DefaultOptimizationType"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties height="22" width="129"/>
																								<children>
																									<text fixtext="Max Iterations: "/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties height="22" width="567"/>
																								<children>
																									<template>
																										<match match="MaxIterations"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties height="22" width="129"/>
																								<children>
																									<text fixtext="Max Time:"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties height="22" width="567"/>
																								<children>
																									<template>
																										<match match="MaxTime"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties height="22" width="129"/>
																								<children>
																									<text fixtext="Base Plan:"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties height="22" width="567"/>
																								<children>
																									<template>
																										<match match="BaseDosePlan"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																							</tablecol>
																						</children>
																					</tablerow>
																				</children>
																			</tablebody>
																		</children>
																	</table>
																</children>
															</template>
															<newline/>
															<table>
																<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
																<children>
																	<tablebody>
																		<children>
																			<tablerow>
																				<children>
																					<tablecol>
																						<properties width="129"/>
																					</tablecol>
																					<tablecol>
																						<properties width="567"/>
																					</tablecol>
																				</children>
																			</tablerow>
																			<tablerow>
																				<children>
																					<tablecol>
																						<properties width="129"/>
																					</tablecol>
																					<tablecol>
																						<properties width="567"/>
																					</tablecol>
																				</children>
																			</tablerow>
																		</children>
																	</tablebody>
																</children>
															</table>
															<template>
																<match match="Brachy"/>
																<children>
																	<newline/>
																	<table>
																		<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
																		<children>
																			<tablebody>
																				<children>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties height="2" width="129"/>
																							</tablecol>
																							<tablecol>
																								<properties height="2" width="567"/>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties height="22" width="129"/>
																								<children>
																									<text fixtext="Iterations: "/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties height="22" width="567"/>
																								<children>
																									<template>
																										<match match="Iterations"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties height="22" width="129"/>
																								<children>
																									<text fixtext="Max Dwell Time:"/>
																								</children>
																							</tablecol>
																							<tablecol>
																								<properties height="22" width="567"/>
																								<children>
																									<template>
																										<match match="MaxDwellTime"/>
																										<children>
																											<xpath allchildren="1"/>
																										</children>
																									</template>
																								</children>
																							</tablecol>
																						</children>
																					</tablerow>
																					<tablerow>
																						<children>
																							<tablecol>
																								<properties width="129"/>
																							</tablecol>
																							<tablecol>
																								<properties width="567"/>
																							</tablecol>
																						</children>
																					</tablerow>
																				</children>
																			</tablebody>
																		</children>
																	</table>
																	<choice>
																		<children>
																			<choiceoption>
																				<testexpression>
																					<xpath value="../Type  != &quot;Helios&quot; or  ../Type  != &quot;Brachy&quot;"/>
																				</testexpression>
																			</choiceoption>
																		</children>
																	</choice>
																	<newline/>
																</children>
															</template>
															<newline/>
															<text fixtext="Structure Objectives"/>
															<newline/>
															<template>
																<match match="ObjectivesAllStructures"/>
																<children>
																	<template>
																		<match match="ObjectivesOneStructure"/>
																		<children>
																			<newline/>
																			<table>
																				<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
																				<children>
																					<tablebody>
																						<children>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="129"/>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="1" width="129"/>
																									</tablecol>
																									<tablecol>
																										<properties height="1" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="2" width="129"/>
																									</tablecol>
																									<tablecol>
																										<properties height="2" width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties width="129"/>
																									</tablecol>
																									<tablecol>
																										<properties width="567"/>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Id:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="@ID"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Surface Only:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="@SurfaceOnly"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Volume Id:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="StructureTarget"/>
																												<children>
																													<template>
																														<match match="VolumeID"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Volume Code:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="StructureTarget"/>
																												<children>
																													<template>
																														<match match="VolumeCode"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Volume Type:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="StructureTarget"/>
																												<children>
																													<template>
																														<match match="VolumeType"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Volume Code Table:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="StructureTarget"/>
																												<children>
																													<template>
																														<match match="VolumeCodeTable"/>
																														<children>
																															<xpath allchildren="1"/>
																														</children>
																													</template>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Sample Points:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="SamplePoints"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																							<tablerow>
																								<children>
																									<tablecol>
																										<properties height="22" width="129"/>
																										<children>
																											<text fixtext="Distance:"/>
																										</children>
																									</tablecol>
																									<tablecol>
																										<properties height="22" width="567"/>
																										<children>
																											<template>
																												<match match="Distance"/>
																												<children>
																													<xpath allchildren="1"/>
																												</children>
																											</template>
																										</children>
																									</tablecol>
																								</children>
																							</tablerow>
																						</children>
																					</tablebody>
																				</children>
																			</table>
																			<template>
																				<match match="StructureObjectives"/>
																				<children>
																					<newline/>
																					<template>
																						<match match="Objective"/>
																						<children>
																							<table dynamic="1">
																								<properties border="0" cellpadding="1" cellspacing="1"/>
																								<children>
																									<tableheader>
																										<children>
																											<tablerow>
																												<children>
																													<tablecol>
																														<children>
																															<text fixtext="Type"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Operator"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Dose"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Volume"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Priority"/>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<text fixtext="Group"/>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tableheader>
																									<tablebody>
																										<children>
																											<tablerow>
																												<children>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Type"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Operator"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Dose"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Volume"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Priority"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																													<tablecol>
																														<children>
																															<template>
																																<match match="Group"/>
																																<children>
																																	<xpath allchildren="1"/>
																																</children>
																															</template>
																														</children>
																													</tablecol>
																												</children>
																											</tablerow>
																										</children>
																									</tablebody>
																								</children>
																							</table>
																						</children>
																					</template>
																				</children>
																			</template>
																		</children>
																	</template>
																</children>
															</template>
														</children>
													</template>
												</children>
											</template>
										</children>
									</template>
									<newline/>
									<text fixtext="Review"/>
									<newline/>
									<template>
										<match match="Review"/>
										<children>
											<newline/>
											<table>
												<properties border="0" cellpadding="1" cellspacing="1" width="100%"/>
												<children>
													<tablebody>
														<children>
															<tablerow>
																<children>
																	<tablecol>
																		<properties width="129"/>
																	</tablecol>
																	<tablecol>
																		<properties width="567"/>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="1" width="129"/>
																	</tablecol>
																	<tablecol>
																		<properties height="1" width="567"/>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="2" width="129"/>
																	</tablecol>
																	<tablecol>
																		<properties height="2" width="567"/>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties width="129"/>
																	</tablecol>
																	<tablecol>
																		<properties width="567"/>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show Min:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowMin"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show Max:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowMax"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show Mean:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowMean"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show Modal:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowModal"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show Median:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowMedian"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show Std Dev:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowStdDev"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show EUD:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowEUD"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show NTCP"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowNTCP"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
															<tablerow>
																<children>
																	<tablecol>
																		<properties height="22" width="129"/>
																		<children>
																			<text fixtext="Show TCP:"/>
																		</children>
																	</tablecol>
																	<tablecol>
																		<properties height="22" width="567"/>
																		<children>
																			<template>
																				<match match="@ShowTCP"/>
																				<children>
																					<xpath allchildren="1"/>
																				</children>
																			</template>
																		</children>
																	</tablecol>
																</children>
															</tablerow>
														</children>
													</tablebody>
												</children>
											</table>
											<newline/>
											<text fixtext="DVH Structures"/>
											<newline/>
											<template>
												<match match="ReviewStructures"/>
												<children>
													<newline/>
													<template>
														<match match="ReviewStructure"/>
														<children>
															<table dynamic="1">
																<properties border="0" border-collapse="1" cellpadding="1"/>
																<children>
																	<tableheader>
																		<children>
																			<tablerow>
																				<children>
																					<tablecol>
																						<children>
																							<text fixtext="Item"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<children>
																							<text fixtext="Type"/>
																						</children>
																					</tablecol>
																					<tablecol>
																						<children>
																							<text fixtext="Selected"/>
																						</children>
																					</tablecol>
																				</children>
																			</tablerow>
																		</children>
																	</tableheader>
																	<tablebody>
																		<children>
																			<tablerow>
																				<children>
																					<tablecol>
																						<children>
																							<template>
																								<match match="Item"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<children>
																							<template>
																								<match match="Type"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																					<tablecol>
																						<children>
																							<template>
																								<match match="@Selected"/>
																								<children>
																									<xpath allchildren="1"/>
																								</children>
																							</template>
																						</children>
																					</tablecol>
																				</children>
																			</tablerow>
																		</children>
																	</tablebody>
																</children>
															</table>
														</children>
													</template>
													<newline/>
												</children>
											</template>
											<newline/>
										</children>
									</template>
								</children>
							</paragraph>
						</children>
					</template>
				</children>
			</paragraph>
		</children>
	</template>
	<template>
		<match match="Phases"/>
		<children>
			<template>
				<match match="Phase"/>
				<children>
					<template>
						<match match="@ID"/>
						<children>
							<xpath allchildren="1"/>
						</children>
					</template>
				</children>
			</template>
		</children>
	</template>
	<pagelayout>
		<properties pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="1" paperheight="11in" papermarginbottom="0.79in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.5in"/>
	</pagelayout>
</structure>
